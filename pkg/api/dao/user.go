package dao

import "zeus/pkg/api/model"

type User struct {
}

func (u User) GetByUserName(username string) model.User {
	db := GetDb()
	m := model.User{}
	db.Where("username = ?", username).First(&m)
	return m
}
