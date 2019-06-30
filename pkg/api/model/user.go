package model

import (
	"time"
)

type User struct {
	Id            int        `json:"id"`
	Username      string     `json:"username"`
	Mobile        string     `json:"mobile"`
	Sex           int        `json:"sex"`
	Realname      string     `json:"realname"`
	Password      string     `json:"-"`
	Salt          string     `json:"-"`
	DepartmentId  int        `json:"department_id"`
	Department    Department `json:"department"`
	Faceicon      string     `json:"faceicon"`
	Email         string     `json:"email"`
	Title         string     `json:"title"`
	Status        int        `json:"status"`
	CreateTime    time.Time  `json:"created_time"`
	LastLoginTime time.Time  `json:"updated_time"`
	Roles []Role `gorm:"many2many:user_role;" json:"roles"`
	//Roles         int     `orm:"rel(m2m);rel_through(zeus/pkg/models.UserRole)"`
}

func (User) TableName() string {
	return "user"
}

type UserClaims struct {
	Id   int    `json:"id"`
	Name string `json:"name"`
}
