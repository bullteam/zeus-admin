package dto

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/gin-gonic/gin/binding"
	"github.com/pkg/errors"
	"gopkg.in/go-playground/validator.v8"
	"strings"
)

//Register custom validate methods
func init() {
	if v, ok := binding.Validator.Engine().(*validator.Validate); ok {
		_ = v.RegisterValidation("customValidate", customValidate)
	}
}
func Bind(c *gin.Context, obj interface{}) error {
	if err := c.ShouldBind(obj); err != nil {
		if fieldErr, ok := err.(validator.ValidationErrors); ok {
			var tagErrorMsg []string
			for _, v := range fieldErr {
				if _, has := ValidateErrorMessage[v.Tag]; has {
					tagErrorMsg = append(tagErrorMsg, fmt.Sprintf(ValidateErrorMessage[v.Tag], v.Field, v.Value))
				} else {
					tagErrorMsg = append(tagErrorMsg, err.Error())
				}
			}
			return errors.New(strings.Join(tagErrorMsg, ","))
		}
	}
	return nil
}

var ValidateErrorMessage = map[string]string{
	"customValidate": "%s can not be %s",
	"required":       "%s is required,got empty%s",
}
