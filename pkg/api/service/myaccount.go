package service

import (
	"crypto/rand"
	"encoding/base32"
	"fmt"
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

// https://github.com/google/google-authenticator/wiki/Key-Uri-Format
func (s MyAccountService) GetSecret(uid int) (userSecretQuery model.UserSecretQuery, err error) {
	v := s.dao.Get(uid)
	if !utils.IsNilObject(v) && v.Account_name != "" {
		userSecretQuery.Account_name = v.Account_name
		userSecretQuery.Secret = v.Secret
		return userSecretQuery, nil
	}
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
	}
	s.dao.Create(&usersecret)
	return userSecretQuery, nil
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
	//User, errs := s.oauthdao.Get(Info.Openid, from)
	//if errs != nil || !utils.IsNilObject(User) {
	//	return "", nil
	//}
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
