package dto

import (
	"gopkg.in/go-playground/validator.v8"
	"reflect"
)

type LoginDto struct {
	Username string `form:"username" json:"username" binding:"required,customValidate"`
	Password string `form:"password" json:"password" binding:"required"`
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
