package model

import "time"

type UserSecret struct {
	Id           int       `json:"id"`
	User_id      int       `json:"user_id"`
	Account_name string    `json:"account_name"`
	Secret       string    `json:"secret"`
	CreateTime   time.Time `json:"create_time"`
	UpdateTime   time.Time `json:"update_time"`
}

type UserSecretQuery struct {
	Account_name string
	Secret       string
}

func (ur *UserSecret) TableName() string {
	return "user_secret"
}
