package dto

import "time"

type UserCreateDto struct {
	Id            int       `json:"id"`
	Username      string    `json:"username" binding:"required"`
	Mobile        string    `json:"mobile"`
	Sex           int       `json:"sex"`
	Realname      string    `json:"realname"`
	Password      string    `json:"password" binding:"required"`
	Salt          string    `json:"-"`
	DepartmentId  int       `json:"department_id"`
	Faceicon      string    `json:"faceicon"`
	Email         string    `json:"email"`
	Title         string    `json:"title"`
	Status        int       `json:"status"`
	CreateTime    time.Time `type(datetime)" json:"create_time"`
	LastLoginTime time.Time `type(datetime)" json:"-"`
}
