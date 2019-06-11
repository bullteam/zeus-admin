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
	Username      string    `json:"username" binding:"required"`
	Mobile        string    `json:"mobile"`
	Sex           int       `json:"sex"`
	Realname      string    `json:"realname"`
	Password      string    `json:"password" binding:"required,pwdValidate"`
	Salt          string    `json:"-"`
	DepartmentId  int       `json:"department_id"`
	Faceicon      string    `json:"faceicon"`
	Email         string    `json:"email"`
	Title         string    `json:"title"`
	Status        int       `json:"status"`
	CreateTime    time.Time `type(datetime)" json:"create_time"`
	LastLoginTime time.Time `type(datetime)" json:"-"`
}

//UserCreateDto - binding user edition params
type UserEditDto struct {
	Id           int    `json:"id" binding:"required"`
	Username     string `json:"username" binding:"required"`
	Mobile       string `json:"mobile"`
	Sex          int    `json:"sex"`
	Realname     string `json:"realname"`
	DepartmentId int    `json:"department_id"`
	Faceicon     string `json:"faceicon"`
	Email        string `json:"email"`
	Title        string `json:"title"`
	Status       int    `json:"status"`
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
