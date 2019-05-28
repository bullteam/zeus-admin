package dto

import (
	"github.com/gin-gonic/gin/binding"
	"gopkg.in/go-playground/validator.v8"
)
//Register custom validate methods
func init()  {
	if v,ok := binding.Validator.Engine().(*validator.Validate);ok{
		v.RegisterValidation("customValidate",customValidate)
	}
}

var ValidateErrorMessage = map[string] string {
	"customValidate" : "%s can not be %s",
}

