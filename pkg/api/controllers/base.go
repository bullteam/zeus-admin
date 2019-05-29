package controllers

import (
	"github.com/gin-gonic/gin"
)

func resp(c *gin.Context, data map[string]interface{}) {
	c.JSON(200, gin.H{
		"code" : 0,
		"data" : data,
	})
}

func ok(c *gin.Context, msg string) {
	c.JSON(200, gin.H{
		"code" : 0,
		"msg" : msg,
	})
}

func fail(c *gin.Context,code int, msg string){
	c.JSON(200, gin.H{
		"code" : code,
		"msg" : msg,
	})
}
