package dingdingtalk

import (
	"fmt"
	dingtalk "github.com/bullteam/go-dingtalk/src"
	"github.com/stretchr/testify/assert"
	"testing"
)

func init() {
	dingTalkClient = dingtalk.NewDingTalkCompanyClient(&dingtalk.DTConfig{
		AppKey:    `dingvgvn9hdcp8qtarno`,
		AppSecret: `Sn887TtSQgGQNRcSaP-cNQXKYOkuT062vPgHoVvbTm5-HA2qnyew6xbdgZwhxD8N`,
		CachePath: `data/`,
	})
}
func TestGetDepartments(t *testing.T) {
	depts, err := GetDepartments()
	assert.NoError(t, err)
	t.Log(fmt.Sprintf("%#v", depts))
}
func TestGetUsers(t *testing.T) {
	depts, _ := GetDepartments()
	for _, depts := range depts.(map[int][]dingtalk.Department) {
		for _, dept := range depts {
			users, _ := GetUsers(dept.Id)
			if len(users.([]dingtalk.UDetailedList)) > 1 {
				t.Log(users)
			}
		}
	}
	//users,err := GetUsers(1)
	//assert.NoError(t,err)
	//t.Log(users)
}
