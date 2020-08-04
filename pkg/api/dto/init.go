package dto

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/gin-gonic/gin/binding"
	"github.com/go-playground/validator/v10"
	"github.com/pkg/errors"
	"strings"
	"zeus/pkg/api/log"
)

func init() {
	// Register custom validate methods
	if v, ok := binding.Validator.Engine().(*validator.Validate); ok {
		_ = v.RegisterValidation("pwdValidate", pwdValidate)
		_ = v.RegisterValidation("permsValidate", permsValidate)
	} else {
		log.Fatal("Gin fail to registered custom validator(v10)")
	}
}

// Bind : bind request dto and auto verify parameters
func Bind(c *gin.Context, obj interface{}) error {
	_ = c.ShouldBindUri(obj)
	if err := c.ShouldBind(obj); err != nil {
		if fieldErr, ok := err.(validator.ValidationErrors); ok {
			var tagErrorMsg []string
			for _, v := range fieldErr {
				if _, has := ValidateErrorMessage[v.Tag()]; has {
					tagErrorMsg = append(tagErrorMsg, fmt.Sprintf(ValidateErrorMessage[v.Tag()], v.Field(), v.Value()))
				} else {
					tagErrorMsg = append(tagErrorMsg, err.Error())
				}
			}
			return errors.New(strings.Join(tagErrorMsg, ","))
		}
	}
	return nil
}

//ValidateErrorMessage : customize error messages
var ValidateErrorMessage = map[string]string{
	"customValidate": "%s can not be %s",
	"required":       "%s is required,got empty %#v",
	"pwdValidate":    "%s is not a valid password",
	"permsValidate":  "perms [%s] is not allow to contains comma",
}
