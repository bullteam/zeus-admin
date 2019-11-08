package service

import (
	"crypto/rand"
	"encoding/base32"
	"fmt"
	"time"
	"zeus/pkg/api/dao"
	"zeus/pkg/api/domain/account/login"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/model"
	"zeus/pkg/api/utils"
)

type MyAccountService struct {
	dao      dao.UserSecretDao
	oauthdao dao.UserOAuthDao
}

/**
  is open user secret
*/
func (s MyAccountService) GetOpen(uid int) bool {
	v := s.dao.Get(uid)
	if v.Is_open == 1 {
		return true
	}
	return false
}

// https://github.com/google/google-authenticator/wiki/Key-Uri-Format
func (s MyAccountService) GetSecret(uid int) (userSecretQuery model.UserSecretQuery, err error) {
	v := s.dao.Get(uid)
	if !utils.IsNilObject(v) && v.Account_name != "" {
		userSecretQuery.Account_name = v.Account_name
		userSecretQuery.Secret = v.Secret
		userSecretQuery.Is_open = v.Is_open
		return userSecretQuery, nil
	}
	return s.createSecret(uid)
}

/**
  create user secret
*/
func (s MyAccountService) createSecret(uid int) (userSecretQuery model.UserSecretQuery, err error) {
	secret := make([]byte, 10)
	_, errs := rand.Read(secret)
	if errs != nil {
		return userSecretQuery, errs
	}
	secretBase32 := base32.StdEncoding.EncodeToString(secret)
	userSecretQuery.Account_name = fmt.Sprintf("Zeus:%d", uid)
	userSecretQuery.Secret = secretBase32
	usersecret := model.UserSecret{
		User_id:      uid,
		Account_name: userSecretQuery.Account_name,
		Secret:       secretBase32,
		Is_open:      0,
		CreateTime:   time.Now(),
		UpdateTime:   time.Now(),
	}
	s.dao.Create(&usersecret)
	return userSecretQuery, nil
}

func (s MyAccountService) Update2FaStatus(uid int, is_open int) int64 {
	myAccountModel := s.dao.Get(uid)
	c := s.dao.Update(&myAccountModel, map[string]interface{}{
		"is_open":     is_open,
		"update_time": time.Now(),
	})
	return c.RowsAffected
}

/**
获取第三方账号绑定列表
*/
func (s MyAccountService) GetThirdList(dto dto.GeneralListDto) ([]model.UserOAuth, int64) {
	return s.oauthdao.List(dto)
}

//绑定第三方应用
func (s MyAccountService) BindDingtalk(code string, uid int, from int) (openid string, err error) {
	Info, err := login.GetDingTalkUserInfo(code)
	if err != nil {
		return "", err
	}
	userOAuth := model.UserOAuth{
		From:    from, // 1表示钉钉
		User_id: uid,
		Name:    Info.Nick,
		Openid:  Info.Openid,
		Unionid: Info.Unionid,
	}
	s.oauthdao.Create(&userOAuth)
	return Info.Openid, nil
}
