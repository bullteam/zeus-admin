package model

import (
	"time"
)

type User struct {
	Id            int        `json:"id" example:"1"`
	Username      string     `json:"username" example:"wutongci"`
	Mobile        string     `json:"mobile" example:"186000000"`
	Sex           int        `json:"sex" example:"1"`
	Realname      string     `json:"realname" example:"黄梧桐"`
	Password      string     `json:"-"`
	Salt          string     `json:"-"`
	DepartmentId  int        `json:"department_id" example:"1"`
	Department    Department `json:"department" example:"1"`
	Faceicon      string     `json:"faceicon" example:"http://xxx.com"`
	Email         string     `json:"email" example:"xxxx@hotmail.com"`
	Title         string     `json:"title" example:"title"`
	Status        int        `json:"status" example:"1"`
	CreateTime    time.Time  `gorm:"type:time;column:create_time;not null;default:CURRENT_TIMESTAMP" json:"created_time,omitempty" example:"2019-07-10 0:39"`
	LastLoginTime time.Time  `gorm:"type:time;column:create_time;not null;default:CURRENT_TIMESTAMP" json:"logined_time,omitempty" example:"2019-07-10 0:39"`
	Roles         []Role     `gorm:"many2many:user_role;" json:"roles" example:"roles"`
}

func (User) TableName() string {
	return "user"
}

type UserClaims struct {
	Id   int    `json:"id"`
	Name string `json:"name"`
}
