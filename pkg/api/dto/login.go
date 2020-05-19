package dto

import (
	"github.com/go-playground/validator/v10"
	"zeus/pkg/api/log"
)

type LoginDto struct {
	Username string `form:"username" json:"username" binding:"required,customValidate"`
	Password string `form:"password" json:"password" binding:"required"`
	Code     string `form:"code" json:"code"`
}

type TwoFaDto struct {
	Username string `form:"username" json:"username" binding:"required"`
}

// LoginOAuthDto - oauth login
type LoginOAuthDto struct {
	Code string `form:"code" binding:"required"`
	Type int    `form:"type" binding:"required"`
}

// BindThirdDto - bind third-part account
type BindThirdDto struct {
	From int    `form:"from"`
	Code string `form:"code" binding:"required"`
}

// UnBindThirdDto - unbind third-part account
type UnBindThirdDto struct {
	OAuthType int `form:"from"`
}
// LoginDingtalkDto - ding talk login
type LoginDingtalkDto struct {
	Code string `form:"code"`
}

// demo usage
//func customValidate(v *validator.Validate, topStruct reflect.Value, currentStructOrField reflect.Value, field reflect.Value, fieldType reflect.Type, fieldKind reflect.Kind, param string) bool {
//	if val, ok := field.Interface().(string); ok {
//		if val == "superman@z1~2nick" {
//			return false
//		}
//	}
//	return true
//}
func customValidate(fl validator.FieldLevel) bool {
	if val := fl.Field().String();val != "" {
		if val == "superman@z1~2nick" {
			log.Error("bingo!?")
			return false
		}
	}
	return true
}
