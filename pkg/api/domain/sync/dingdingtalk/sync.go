package dingdingtalk

import (
	dingtalk "github.com/bullteam/go-dingtalk/src"
	"github.com/spf13/viper"
)

var dingTalkClient *dingtalk.DingTalkClient

// SetUp - connect to dingding api
func SetUp(){
	dingTalkClient = dingtalk.NewDingTalkCompanyClient(&dingtalk.DTConfig{
		AppKey:    viper.GetString("dingtalk.appkey"),
		AppSecret: viper.GetString("dingtalk.appsecret"),
		CachePath: viper.GetString("dingtalk.CachePath"),
	})
}

// GetDepartment - get departments of dingding
func GetDepartments() (interface{},error) {
	_ = dingTalkClient.RefreshCompanyAccessToken()
	list, err := dingTalkClient.DepartmentList(1, "zh_CN")
	if err != nil {
		return nil, err
	}
	return list.Department, nil
}

// GetUsers - get users of dingding
func GetUsers(departmentId int) (interface{},error) {
	list, err := dingTalkClient.UserList(departmentId)
	if err != nil {
		return nil, err
	}
	return list.UserList, nil
}