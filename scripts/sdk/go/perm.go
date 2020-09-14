package ZeusSdk

import (
	"encoding/json"
	"errors"
	"fmt"
	"github.com/dgrijalva/jwt-go"
	"io/ioutil"
	"net/http"
	"net/url"
	"strings"
	"time"
)

/**
 * 权限接口地址
 **/
const CENTERSERVICE = "http://api.auth.bullteam.cn"
const API_PERM_LIST = "v1/user/perm/list"
const API_PERM_CHECK = "v1/user/perm/check"

type UserClaims struct {
	Id   int    `json:"uid"`
	Name string `json:"uname"`
}

type CheckPermRes struct {
	Code int          `json:"code"`
	Data *CheckResult `json:"data"`
}
type CheckResult struct {
	Result bool `json:"result"`
}

type PermList struct {
	Code int             `json:"code"`
	Data *PermListResult `json:"data"`
}

type PermListResult struct {
	Result interface{} `json:"result"`
}

var PermResFail struct {
	Code   int    `json:"code"`
	Detail string `json:"detail"`
	Msg    string `json:"msg"`
}

type CustomClaims struct {
	User *UserClaims `json:"user"`
	jwt.StandardClaims
}

type ZeusSdkService struct {
}

func (Z ZeusSdkService) CheckPerm(tokenStr string, domain string, perm string) (bool, error) {
	requestUrl := CENTERSERVICE + "/" + API_PERM_CHECK
	client := &http.Client{}
	data := url.Values{"domain": {domain}, "perm": {perm}}
	req, err := http.NewRequest("POST", requestUrl, strings.NewReader(data.Encode()))
	if err != nil {
		return false, errors.New("remote api error")
	}
	req.Header.Set("Content-Type", "application/x-www-form-urlencoded")
	req.Header.Set("Authorization", "Bearer "+string(tokenStr))
	resp, err := client.Do(req)
	defer resp.Body.Close()
	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		return false, errors.New("error request body")
	}
	var p CheckPermRes
	json.Unmarshal(body, &p)
	if p.Data.Result == true {
		return true, nil
	}
	return false, errors.New("error result")
}

/**
 * 获取用户权限列表（包括功能权限和数据权限）
 * 各自业务实现时，可缓存起来，减少网络io
 */
func (Z ZeusSdkService) GetUserPerms(tokenStr string, domain string) (interface{}, error) {
	requestUrl := CENTERSERVICE + "/" + API_PERM_LIST + "?domain=" + domain
	client := &http.Client{}
	req, err := http.NewRequest("GET", requestUrl, nil)
	if err != nil {
		return false, errors.New("remote api error")
	}
	req.Header.Set("Authorization", "Bearer "+string(tokenStr))
	resp, err := client.Do(req)
	defer resp.Body.Close()
	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		return false, errors.New("error request body")
	}
	//fmt.Println(bytes.NewBuffer(body).String())
	var p PermList
	json.Unmarshal(body, &p)
	return p.Data.Result, errors.New("error result")
}

/**
 * 验证jwt
 */
func (Z ZeusSdkService) VerifyToken(tokenStr string) error {
	token, err := jwt.Parse(tokenStr, func(token *jwt.Token) (interface{}, error) {
		if _, ok := token.Method.(*jwt.SigningMethodRSA); !ok {
			return nil, fmt.Errorf("Unexpected signing method: %v", token.Header["alg"])
		}
		verifyBytes, err := ioutil.ReadFile("./pub_key.pub")
		if err != nil {
			return nil, err
		}
		verifyKey, err := jwt.ParseRSAPublicKeyFromPEM(verifyBytes)
		if err != nil {
			return nil, err
		}
		return verifyKey, nil
	})

	if err != nil {
		return err
	}
	claims, ok := token.Claims.(jwt.MapClaims)
	if ok && token.Valid {
		if !claims.VerifyExpiresAt(time.Now().Unix(), true) {
			return errors.New("VerifyExpiresAt")
		}
	}
	return nil
}

/**
  获取用户信息
*/
func (Z ZeusSdkService) GetUserInfo(tokenStr string) (error, interface{}) {
	token, err := jwt.Parse(tokenStr, func(token *jwt.Token) (interface{}, error) {
		if _, ok := token.Method.(*jwt.SigningMethodRSA); !ok {
			return nil, fmt.Errorf("Unexpected signing method: %v", token.Header["alg"])
		}
		verifyBytes, err := ioutil.ReadFile("./pub_key.pub")
		if err != nil {
			return nil, err
		}
		verifyKey, err := jwt.ParseRSAPublicKeyFromPEM(verifyBytes)
		if err != nil {
			return nil, err
		}
		return verifyKey, nil
	})

	if err != nil {
		return err, nil
	}
	claims, ok := token.Claims.(jwt.MapClaims)
	if ok && token.Valid {
		if !claims.VerifyExpiresAt(time.Now().Unix(), true) {
			return errors.New("VerifyExpiresAt"), nil
		}
	}
	if token != nil {
		if token.Valid {
			claims, _ := token.Claims.(jwt.MapClaims)
			//var user string = claims["uname"].(string)
			return nil, claims
		}
	}
	return errors.New("error token"), nil
}
