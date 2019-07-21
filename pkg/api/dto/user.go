package dto

import (
	"gopkg.in/go-playground/validator.v8"
	"reflect"
	"time"
)

// UserListSearchMapping - define search query keys in user list page
var UserListSearchMapping = map[string]string{
	"n": "username",
	"d": "department_id",
}

//UserCreateDto - binding user creation params
type UserCreateDto struct {
	Id            int       `json:"id"`
	Username      string    `form:"username" json:"username" binding:"required"`
	Mobile        string    `form:"mobile" json:"mobile"`
	Sex           int       `form:"sex" json:"sex"`
	Realname      string    `form:"realname" json:"realname"`
	Password      string    `form:"password" json:"password" binding:"required,pwdValidate"`
	Salt          string    `json:"-"`
	DepartmentId  int       `form:"department_id" json:"department_id"`
	Faceicon      string    `json:"faceicon"`
	Email         string    `form:"email" json:"email"`
	Title         string    `form:"title" json:"title"`
	Status        int       `form:"status" json:"status"`
	CreateTime    time.Time `type(datetime)" json:"create_time"`
	LastLoginTime time.Time `type(datetime)" json:"-"`
}

//UserCreateDto - binding user edition params
type UserEditDto struct {
	Id           int    `uri:"id" json:"id" binding:"required"`
	Username     string `form:"username" json:"username" binding:"required"`
	Mobile       string `form:"mobile" json:"mobile"`
	Sex          int    `form:"sex" json:"sex"`
	Realname     string `form:"realname" json:"realname"`
	DepartmentId int    `form:"department_id" json:"department_id"`
	Faceicon     string `json:"faceicon"`
	Email        string `form:"email" json:"email"`
	Title        string `form:"title" json:"title"`
	Status       int    `form:"status,default=1" json:"status"`
}

// UserEditStatusDto - User update status only
type UserEditStatusDto struct {
	Id     int `uri:"id" json:"id" binding:"required,min=1"`
	Status int `form:"status" json:"status" binding:"gte=0"`
}

type UserMoveDepartmentDto struct {
	Ids        string `form:"ids" json:"ids" binding:"required"`
	Department int    `form:"department" json:"department" binding:"required,gte=1"`
}

// UserEditPasswordDto - User update password only
type UserEditPasswordDto struct {
	Id       int    `uri:"id" json:"id" binding:"required"`
	Password string `form:"password" json:"password" binding:"required,pwdValidate"`
	Salt     string
}

type LoginDingtalkDto struct {
	Code string `form:"code" binding:"customValidate"`
}

type BindThirdDto struct {
	From int    `form:"from"`
	Code string `form:"code"`
}

type UnBindThirdDto struct {
	From int `form:"from"`
}

// password validator
func pwdValidate(v *validator.Validate, topStruct reflect.Value, currentStructOrField reflect.Value, field reflect.Value, fieldType reflect.Type, fieldKind reflect.Kind, param string) bool {
	if val, ok := field.Interface().(string); ok {
		if len(val) < 6 {
			return false
		}
	}
	return true
}
