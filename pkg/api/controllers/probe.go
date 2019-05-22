package controllers

import (
	"github.com/gin-gonic/gin"
)

func Healthy(c *gin.Context) {
	c.JSON(200, gin.H{
		"code": 0,
		"data": "",
	})
}