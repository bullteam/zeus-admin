package dao

import (
	"fmt"
	"github.com/jinzhu/gorm"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/model"
)

type User struct {
}

//Get - get single user info
func (User) Get(id int,preload bool) model.User {
	var user model.User
	if preload {
		db = db.Preload("Department")
	}
	db.Where("id = ?", id).First(&user)
	return user
}

// List - users list
func (User) List(listDto dto.GeneralListDto) ([]model.User, int64) {
	var users []model.User
	var total int64
	db := GetDb()
	for sk, sv := range listDto.TransformSearch(dto.UserListSearchMapping) {
		db = db.Where(fmt.Sprintf("%s = ?", sk), sv)
	}
	db.Preload("Department").Offset(listDto.Offset).Limit(listDto.Limit).Find(&users)
	db.Model(&model.User{}).Count(&total)
	return users, total
}

// Create - new user
func (u User) Create(user *model.User) *gorm.DB {
	db := GetDb()
	return db.Save(user)
}

// Update - update user
func (u User) Update(user *model.User) *gorm.DB {
	db := GetDb()
	return db.Save(user)
}

// Create - new user
func (u User) Delete(user *model.User) *gorm.DB {
	db := GetDb()
	return db.Delete(user)
}

// GetByUserName - get user from name
func (u User) GetByUserName(username string) model.User {
	db := GetDb()
	m := model.User{}
	db.Where("username = ?", username).First(&m)
	return m
}