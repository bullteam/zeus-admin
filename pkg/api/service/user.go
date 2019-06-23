package service

import (
	"crypto/rand"
	"fmt"
	"golang.org/x/crypto/scrypt"
	"io"
	"zeus/pkg/api/dao"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/log"
	"zeus/pkg/api/model"
)

const pwHashBytes = 64

var userDao = dao.User{}

type UserService struct {
}

func (us UserService) InfoOfId(dto dto.GeneralGetDto) model.User {
	return userDao.Get(dto.Id)
}

// List - users list with pagination
func (us UserService) List(dto dto.GeneralListDto) ([]model.User, int64) {
	return userDao.List(dto)
}

// Create - create a new account
func (us UserService) Create(dto dto.UserCreateDto) model.User {
	salt, _ := makeSalt()
	pwd, _ := hashPassword(dto.Password, salt)
	userModel := model.User{
		Username:     dto.Username,
		Mobile:       dto.Mobile,
		Password:     pwd,
		DepartmentId: dto.DepartmentId,
		Salt:         salt,
	}
	c := userDao.Create(&userModel)
	if c.Error != nil {
		log.Error(c.Error.Error())
	}
	return userModel
}

// Update - update user's information
func (us UserService) Update(dto dto.UserEditDto) int64 {
	userModel := model.User{
		Id:           dto.Id,
		Username:     dto.Username,
		Mobile:       dto.Mobile,
		DepartmentId: dto.DepartmentId,
	}
	c := userDao.Update(&userModel)
	return c.RowsAffected
}

// Delete - delete user
func (us UserService) Delete(dto dto.GeneralDelDto) int64 {
	userModel := model.User{
		Id: dto.Id,
	}
	c := userDao.Delete(&userModel)
	return c.RowsAffected
}

//VerifyAndReturnUserInfo - login and return user info
func (us UserService) VerifyAndReturnUserInfo(dto dto.LoginDto) (bool, model.User) {
	userModel := userDao.GetByUserName(dto.Username)
	if pwd, err := hashPassword(dto.Password, userModel.Salt); err == nil && pwd == userModel.Password {
		return true, userModel
	}
	return false, model.User{}
}

func makeSalt() (salt string, err error) {
	buf := make([]byte, pwHashBytes)
	if _, err := io.ReadFull(rand.Reader, buf); err != nil {
		return "", err
	}
	return fmt.Sprintf("%x", buf), nil
}

func hashPassword(password string, salt string) (hash string, err error) {
	h, err := scrypt.Key([]byte(password), []byte(salt), 16384, 8, 1, pwHashBytes)
	if err != nil {
		return "", err
	}
	return fmt.Sprintf("%x", h), nil
}
