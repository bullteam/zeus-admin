package router

import (
	"github.com/gin-gonic/gin"
	"zeus/pkg/api/controllers"
)

func Init(e *gin.Engine) {
	e.Use(
		gin.Recovery(),
	)
	e.GET("/test", controllers.Healthy)
	e.Run(":88")
}
