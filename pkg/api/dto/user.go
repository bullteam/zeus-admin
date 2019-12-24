package dto

import (
	"gopkg.in/go-playground/validator.v8"
	"reflect"
	"regexp"
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
	Mobile        string    `form:"mobile" json:"mobile" binding:"required"`
	Sex           int       `form:"sex" json:"sex"`
	Realname      string    `form:"realname" json:"realname"`
	Password      string    `form:"password" json:"password" binding:"required,pwdValidate"`
	Salt          string    `json:"-"`
	DepartmentId  int       `form:"department_id" json:"department_id"`
	Faceicon      string    `json:"faceicon"`
	Email         string    `form:"email" json:"email"`
	Title         string    `form:"title" json:"title"`
	Status        int       `form:"status,default=1" json:"status"`
	CreateTime    time.Time `type(datetime)" json:"create_time"`
	LastLoginTime time.Time `type(datetime)" json:"-"`
	Roles         string    `form:"roles" json:"roles"`
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
	Roles        string `form:"roles" json:"roles"`
}

// UserEditStatusDto - User update status only
type UserEditStatusDto struct {
	Id     int `uri:"id" json:"id" binding:"required,min=1"`
	Status int `form:"status" json:"status" binding:"gte=0"`
}

type UserMoveDepartmentDto struct {
	Ids        string `form:"uids" json:"uids" binding:"required"`
	Department int    `form:"department_id" json:"department_id" binding:"required,gte=1"`
}

// UserEditPasswordDto - User update password only
type UserEditPasswordDto struct {
	Id       int    `uri:"id" json:"id" binding:"required"`
	Password string `form:"new_password" json:"password" binding:"required,pwdValidate"`
	//RePassword string `form:"re_password" json:"re_password" binding:"required,pwdValidate"`
}

//Account edit password only
type AccountEditPasswordDto struct {
	Id          int
	RePassword  string `form:"re_password" json:"re_password" binding:"required,pwdValidate"`
	NewPassword string `form:"new_password" json:"new_password" binding:"required,pwdValidate"`
}

//UserInDomainDto
type UserInDomainDto struct {
	Domain string `form:"domain" json:"domain" binding:"required"`
}

// password validator
func pwdValidate(v *validator.Validate, topStruct reflect.Value, currentStructOrField reflect.Value, field reflect.Value, fieldType reflect.Type, fieldKind reflect.Kind, param string) bool {
	reg := regexp.MustCompile(`^[a-zA-Z0-9!@#$%^&*]{6,}$`)
	if val, ok := field.Interface().(string); ok {
		if !reg.Match([]byte(val)) {
			return false
		}
	}
	return true
}
