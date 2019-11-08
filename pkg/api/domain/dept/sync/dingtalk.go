package sync

import (
	dingtalk "github.com/bullteam/go-dingtalk/src"
	"github.com/spf13/viper"
)

func GetDingTalkUserInfo() (deptInfos interface{}, err error) {
	c := GetCompanyDingTalkClient()
	c.RefreshCompanyAccessToken()
	list, err := c.DepartmentList(1, "zh_CN")
	if err != nil {
		return nil, err
	}
	return list.Department, nil
}

func GetCompanyDingTalkClient() *dingtalk.DingTalkClient {
	return dingtalk.NewDingTalkCompanyClient(&dingtalk.DTConfig{
		AppKey:    viper.GetString("dingtalk.appkey"),
		AppSecret: viper.GetString("dingtalk.appsecret"),
		CachePath: viper.GetString("dingtalk.CachePath"),
	})
}
