package service

import (
	"github.com/spf13/viper"
	"testing"
	"zeus/pkg/api/dao"
)

func initDb() {
	viper.Set("mysql.dsn", "root:root@tcp(127.0.0.1:8889)/zeus?charset=utf8&parseTime=True&loc=Local")
	viper.Set("mysql.pool.min", 1)
	viper.Set("mysql.pool.max", 2)
	dao.Setup()
}
func TestAccountService_Verify(t *testing.T) {
	initDb()
	accountService := AccountService{}
	if ok, _ := accountService.VerifyAndReturnUserInfo("admin", "123456"); ok {
		t.Log("ok")
	} else {
		t.Error("fail")
	}
}
