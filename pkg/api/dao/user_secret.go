package dao

import (
	"github.com/jinzhu/gorm"
	"zeus/pkg/api/model"
)

type UserSecretDao struct {
}

func (u UserSecretDao) Get(id int) model.UserSecret {
	var userSecret model.UserSecret
	db.Where("user_id = ?", id).First(&userSecret)
	return userSecret
}

func (u UserSecretDao) Create(UserSecret *model.UserSecret) *gorm.DB {
	db := GetDb()
	return db.Save(UserSecret)
}
