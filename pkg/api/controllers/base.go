package controllers

import (
	"github.com/gin-gonic/gin"
)

func resp(c *gin.Context, data map[string]interface{}) {
	c.JSON(200, data)
}
