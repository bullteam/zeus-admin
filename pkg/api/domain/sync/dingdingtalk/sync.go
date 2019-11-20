package dingdingtalk

import (
	dingtalk "github.com/bullteam/go-dingtalk/src"
	"github.com/spf13/viper"
)

var dingTalkClient *dingtalk.DingTalkClient

// connect to dingding api
func SetUp() {
	dingTalkClient = dingtalk.NewDingTalkCompanyClient(&dingtalk.DTConfig{
		AppKey:    viper.GetString("dingtalk.appkey"),
		AppSecret: viper.GetString("dingtalk.appsecret"),
		CachePath: viper.GetString("dingtalk.CachePath"),
	})
}

// GetDepartment - get departments of dingding
func GetDepartments() (interface{}, error) {
	_ = dingTalkClient.RefreshCompanyAccessToken()
	var treeDepartment = map[int][]dingtalk.Department{}
	list, err := dingTalkClient.DepartmentList(1, "zh_CN")
	if err != nil {
		return nil, err
	}
	for _, d := range list.Department {
		treeDepartment[d.ParentId] = append(treeDepartment[d.ParentId], d)
	}
	return treeDepartment, nil
}

// GetUsers - get users of dingding
func GetUsers(departmentId int) (interface{}, error) {
	list, err := dingTalkClient.UserList(departmentId)
	if err != nil {
		return nil, err
	}
	return list.UserList, nil
}
