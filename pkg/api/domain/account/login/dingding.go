package login

import (
	dingtalk "github.com/icepy/go-dingtalk/src"
	"github.com/spf13/viper"
)

type DingtalkUserInfo struct {
	Openid  string
	Unionid string
	Nick    string
	Dingid  string
}

func GetUserInfo(code string) (UserInfo *DingtalkUserInfo, err error) {
	c := GetCompanyDingTalkClient()
	c.RefreshSNSAccessToken()
	perInfo, err := c.SNSGetPersistentCode(code)
	if err != nil {
		return nil, err
	}
	snstoken, err := c.SNSGetSNSToken(perInfo.OpenID, perInfo.PersistentCode)
	if err != nil {
		return nil, err
	}
	Info, _ := c.SNSGetUserInfo(snstoken.SnsToken)
	userInfo := &DingtalkUserInfo{
		Info.UserInfo.OpenID,
		Info.UserInfo.UnionID,
		Info.UserInfo.Nick,
		Info.UserInfo.DingID,
	}
	return userInfo, nil
}

func GetCompanyDingTalkClient() *dingtalk.DingTalkClient {
	SNSAppID := viper.GetString("dingtalk.SNSAppID")
	SNSSecret := viper.GetString("dingtalk.SNSSecret")
	config := &dingtalk.DTConfig{
		SNSAppID:  SNSAppID,
		SNSSecret: SNSSecret,
	}
	return dingtalk.NewDingTalkCompanyClient(config)
}
