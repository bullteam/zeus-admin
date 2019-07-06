package model

import "time"

type UserOAuth struct {
	Id         int       `json:"id"`
	From       int       `json:"from"`
	User_id    int       `json:"user_id"`
	Openid     string    `json:"openid"`
	Unionid    string    `json:"unionid"`
	Avatar     string    `json:"avatar"`
	Extra      string    `json:"extra"`
	Name       string    `json:"name"`
	CreateTime time.Time `json:"create_time"`
	UpdateTime time.Time `json:"update_time"`
}

func (ur *UserOAuth) TableName() string {
	return "user_oauth"
}
