package model

import (
	"github.com/jinzhu/gorm"
	"time"
)

type User struct {
	gorm.Model
	Id            int        `json:"id"`
	UserName      string     `json:"username"`
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
	CreateTime    time.Time  `orm:"auto_now_add;type(datetime)" json:"create_time"`
	LastLoginTime time.Time  `orm:"auto_now_add;type(datetime)" json:"-"`
	//Roles         int     `orm:"rel(m2m);rel_through(zeus/pkg/models.UserRole)"`
}
