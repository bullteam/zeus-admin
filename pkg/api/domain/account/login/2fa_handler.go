package login

import (
	"crypto/md5"
	"encoding/json"
	"fmt"
	"github.com/pkg/errors"
	"github.com/spf13/viper"
	"io/ioutil"
	"net/http"
	"sort"
	"strings"
	"time"
	"zeus/pkg/api/log"
)

func keySortMd5Sign(params map[string]string, privateKey string) string {
	var keys []string
	var strToSign = ""
	var rawRequest []string
	for k := range params {
		keys = append(keys, k)
	}
	sort.Strings(keys)
	for _, key := range keys {
		rawRequest = append(rawRequest, key+"="+params[key])
		strToSign = strToSign + key + params[key]
	}
	signed := fmt.Sprintf("%x", md5.Sum([]byte(strToSign+privateKey)))
	return strings.Join(rawRequest, "&") + "&sign=" + signed
}

type SmsSendAdapter interface {
	SignQuery(mobile string, privateKey string) string
	Send(mobile string) error
}

type SmsSendChebao struct {
	RequestApi string
	PrivateKey string
}

func (ssc *SmsSendChebao) SignQuery(mobile string) string {
	var keys []string
	var strToSign = ""
	var rawRequest []string
	params := map[string]string{
		"mobile":   mobile,
		"password": "",
		"scene":    "10",
		"ts":       fmt.Sprintf("%d", time.Now().Unix()),
		"version":  "3.2.0",
	}
	for k := range params {
		keys = append(keys, k)
	}
	sort.Strings(keys)
	for _, key := range keys {
		rawRequest = append(rawRequest, key+"="+params[key])
		strToSign = strToSign + key + params[key]
	}
	signed := fmt.Sprintf("%x", md5.Sum([]byte(strToSign+ssc.PrivateKey)))
	return strings.Join(rawRequest, "&") + "&sign=" + signed
}

// Send code
func (ssc *SmsSendChebao) Send(mobile string) error {
	if ssc.RequestApi == "" {
		ssc.RequestApi = viper.GetString("security.2fa.smsRequestApi")
	}
	if ssc.PrivateKey == "" {
		ssc.PrivateKey = viper.GetString("security.2fa.smsSignKey")
	}
	if ssc.RequestApi == "" {
		log.Error("sms sending api not set")
		return errors.New("sms sending api not set")
	}
	query := ssc.SignQuery(mobile)
	resp, err := http.Post(ssc.RequestApi,
		"application/x-www-form-urlencoded",
		strings.NewReader(query))
	var content []byte
	if err == nil {
		content, _ = ioutil.ReadAll(resp.Body)
		_ = resp.Body.Close()
	}
	result := string(content)
	if strings.Index(result, `"code":0`) > 0 {
		return nil
	} else {
		//log.Error(result)
		var rs map[string]interface{}
		_ = json.Unmarshal([]byte(result), &rs)
		if _, ok := rs["msg"]; ok {
			log.Error(rs["msg"].(string))
			return errors.New(rs["msg"].(string))
		}
		return errors.New("sms send fail")
	}
	//return errors.New("sms sending api not set")
}
