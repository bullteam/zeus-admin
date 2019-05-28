package service

import (
	"crypto/rand"
	"fmt"
	"golang.org/x/crypto/scrypt"
	"io"
	"zeus/pkg/api/dao"
	"zeus/pkg/api/model"
)

const pwHashBytes = 64

type AccountService struct {
}

func (as AccountService) VerifyAndReturnUserInfo(username, password string) (bool, model.User) {
	userDao := dao.User{}
	userModel := userDao.GetByUserName(username)
	if pwd, err := as.hashPassword(password, userModel.Salt); err == nil && pwd == userModel.Password {
		return true, userModel
	}
	return false, model.User{}
}

func (as AccountService) makeSalt() (salt string, err error) {
	buf := make([]byte, pwHashBytes)
	if _, err := io.ReadFull(rand.Reader, buf); err != nil {
		return "", err
	}
	return fmt.Sprintf("%x", buf), nil
}

func (as AccountService) hashPassword(password string, salt string) (hash string, err error) {
	h, err := scrypt.Key([]byte(password), []byte(salt), 16384, 8, 1, pwHashBytes)
	if err != nil {
		return "", err
	}
	return fmt.Sprintf("%x", h), nil
}
