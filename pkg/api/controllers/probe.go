package controllers

import (
	"github.com/gin-gonic/gin"
)

// @Summary 测试
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{""}}"
// @Router /test [get]
func Healthy(c *gin.Context) {
	c.JSON(200, gin.H{
		"code": 0,
		"data": "",
	})
}
