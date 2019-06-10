package dao

import (
	"github.com/jinzhu/gorm"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/model"
)

type User struct {
}

// List - users list
func (u User) List(dto dto.GeneralListDto) ([]model.User, int64) {
	var users []model.User
	var total int64
	GetDb().Offset(dto.Offset).Limit(dto.Limit).Find(&users)
	GetDb().Model(&model.User{}).Count(&total)
	return users, total
}

// GetByUserName - get user from name
func (u User) GetByUserName(username string) model.User {
	db := GetDb()
	m := model.User{}
	db.Where("username = ?", username).First(&m)
	return m
}

// Create - new user
func (u User) Create(user *model.User) *gorm.DB {
	db := GetDb()
	return db.Save(user)
}
