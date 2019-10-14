package dto

import (
	"gopkg.in/go-playground/validator.v8"
	"reflect"
)

type LoginDto struct {
	Username string `form:"username" json:"username" binding:"required,customValidate"`
	Password string `form:"password" json:"password" binding:"required"`
}

//oauth login
type LoginOAuthDto struct {
	Code string `form:"code" binding:"required"`
	Type int    `form:"type" binding:"required"`
}

type BindThirdDto struct {
	From int    `form:"from"`
	Code string `form:"code"`
}

//unbind
type UnBindThirdDto struct {
	OAuthType int `form:"from"`
}

// demo usage
func customValidate(v *validator.Validate, topStruct reflect.Value, currentStructOrField reflect.Value, field reflect.Value, fieldType reflect.Type, fieldKind reflect.Kind, param string) bool {
	if val, ok := field.Interface().(string); ok {
		if val == "superman@z1~2nick" {
			return false
		}
	}
	return true
}
