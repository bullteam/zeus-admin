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
	resp(c, gin.H{
		"id":   claims["id"],
		"name": user.(*model.UserClaims).Name,
		"text": "Hello World.",
	})
}
