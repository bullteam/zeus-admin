package dto

import "time"

type UserSecretCreateDto struct {
	Id           int       `json:"id"`
	User_id      int       `form:"user_id" json:"user_id"`
	Account_name string    `form:"account_name" json:"account_name"`
	Secret       string    `form:"secret" json:"secret"`
	CreateTime   time.Time `type(datetime)" json:"create_time"`
	UpdateTime   time.Time `type(datetime)" json:"-"`
}
