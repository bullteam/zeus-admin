package service

import (
	"github.com/spf13/viper"
	"testing"
	"zeus/pkg/api/dao"
	"zeus/pkg/api/dto"
)

func initDb() {
	viper.Set("mysql.dsn", "root:root@tcp(127.0.0.1:8889)/zeus?charset=utf8&parseTime=True&loc=Local")
	viper.Set("mysql.pool.min", 1)
	viper.Set("mysql.pool.max", 2)
	dao.Setup()
}
func TestAccountService_Verify(t *testing.T) {
	initDb()
	accountService := UserService{}
	if ok, _ := accountService.VerifyAndReturnUserInfo(dto.LoginDto{"admin", "123456"}); ok {
		t.Log("ok")
	} else {
		t.Error("fail")
	}
}
func TestAccountService_Create(t *testing.T) {
	initDb()
	accountService := UserService{}
	m := accountService.Create(dto.UserCreateDto{
		Username:     "lake",
		Password:     "123456",
		DepartmentId: 1,
		Mobile:       "135123345678",
	})
	t.Log(m)
}
