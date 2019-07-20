package dto

import "time"

type UserOAuthCreateDto struct {
	Id         int       `form:"id" json:"id"`
	From       int       `form:"from" json:"from"`
	User_id    int       `form:"user_id" json:"user_id"`
	Openid     string    `form:"openid" json:"openid"`
	Unionid    string    `form:"unionid" json:"unionid"`
	Avatar     string    `form:"avatar" json:"avatar"`
	Extra      string    `form:"extra" json:"extra"`
	Name       string    `form:"name" json:"name"`
	CreateTime time.Time `type(datetime)" json:"create_time"`
	UpdateTime time.Time `type(datetime)" json:"-"`
}
