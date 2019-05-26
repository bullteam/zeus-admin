package controllers

import (
	"github.com/appleboy/gin-jwt"
	"github.com/gin-gonic/gin"
	"zeus/pkg/api/model"
)

type UserController struct{}

func (u UserController) Info(c *gin.Context) {
	claims := jwt.ExtractClaims(c)
	user, _ := c.Get("id")
	c.JSON(200, gin.H{
		"userID":   claims["id"],
		"userName": user.(*model.User).UserName,
		"text":     "Hello World.",
	})
}
