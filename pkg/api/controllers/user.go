package controllers

import (
	"github.com/appleboy/gin-jwt"
	"github.com/gin-gonic/gin"
	"zeus/pkg/api/model"
)

type UserController struct{}

// @Summary 用户信息
// @Produce  json
// @Param id  query string true "ID"
// @Success 200 {string} json "{"code":200,"data":{"userID":1,"userName":"test","text":"hello"}}"
// @Router /v1/api/info [get]
func (u UserController) Info(c *gin.Context) {
	claims := jwt.ExtractClaims(c)
	user, _ := c.Get("id")
	c.JSON(200, gin.H{
		"userID":   claims["id"],
		"userName": user.(*model.User).UserName,
		"text":     "Hello World.",
	})
}
