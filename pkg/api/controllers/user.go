package controllers

import (
	"github.com/gin-gonic/gin"
)

type UserController struct{}

// @Summary 用户信息
// @Produce  json
// @Success 200 {string} json "{"code":0,"data":{"id":1,"name":"test"}}"
// @Router /v1/api/info [get]
func (u UserController) Info(c *gin.Context) {
	resp(c, gin.H{
		"id":   c.Value("userId"),
		"name": c.Value("userName"),
	})
}
