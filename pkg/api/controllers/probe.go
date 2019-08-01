package controllers

import (
	"github.com/gin-gonic/gin"
)

// @Tags Health
// @Summary 健康检查
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{""}}"
// @Router /healthcheck [get]
func Healthy(c *gin.Context) {
	//resp(c, gin.H{
	//	"data":   true,
	//})
	fail(c, Err404)
}
