package model

import "time"

type UserOAuth struct {
	Id         int       `json:"id"`
	From       int       `json:"from"`
	UserId     int       `json:"user_id"`
	Openid     string    `json:"openid"`
	UnionId    string    `json:"unionid"`
	Avatar     string    `json:"avatar"`
	Extra      string    `json:"extra"`
	Name       string    `json:"name"`
	CreateTime time.Time `gorm:"type:time;column:create_time;not null;default:CURRENT_TIMESTAMP" json:"create_time,omitempty" example:"2019-07-10 0:39"`
	UpdateTime time.Time `gorm:"type:time;column:update_time;not null;default:CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP" json:"update_time,omitempty" example:"2019-07-10 0:39"`
}

func (ur *UserOAuth) TableName() string {
	return "user_oauth"
}
