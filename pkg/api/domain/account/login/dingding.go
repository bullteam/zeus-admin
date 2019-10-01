package login

import (
	"fmt"
	dingtalk "github.com/icepy/go-dingtalk/src"
	"github.com/spf13/viper"
)

type DingtalkUserInfo struct {
	Openid  string
	Unionid string
	Nick    string
	Dingid  string
}

//GetDingTalkUserInfo - get dingdingtalk's userinfo by code
func GetDingTalkUserInfo(code string) (UserInfo *DingtalkUserInfo, err error) {
	c := GetCompanyDingTalkClient()
	_ = c.RefreshSNSAccessToken()
	perInfo, err := c.SNSGetPersistentCode(code)
	fmt.Print(perInfo, err)
	if err != nil {
		return nil, err
	}
	snstoken, err := c.SNSGetSNSToken(perInfo.OpenID, perInfo.PersistentCode)
	fmt.Print(snstoken)
	if err != nil {
		return nil, err
	}
	dtUser, err := c.SNSGetUserInfo(snstoken.SnsToken)
	if err != nil {
		return nil, err
	}
	return &DingtalkUserInfo{
		dtUser.UserInfo.OpenID,
		dtUser.UserInfo.UnionID,
		dtUser.UserInfo.Nick,
		dtUser.UserInfo.DingID,
	}, nil
}

func GetCompanyDingTalkClient() *dingtalk.DingTalkClient {
	return dingtalk.NewDingTalkCompanyClient(&dingtalk.DTConfig{
		SNSAppID:  viper.GetString("dingtalk.SNSAppID"),
		SNSSecret: viper.GetString("dingtalk.SNSSecret"),
	})
}
