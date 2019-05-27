package router

import (
	"github.com/gin-gonic/gin"
	"zeus/pkg/api/controllers"
	"zeus/pkg/api/middleware"
	"github.com/swaggo/gin-swagger"
	"github.com/swaggo/gin-swagger/swaggerFiles"
	_ "zeus/docs"
)

func Init(e *gin.Engine) {
	e.Use(
		gin.Recovery(),
	)
	e.GET("/swagger/*any", ginSwagger.WrapHandler(swaggerFiles.Handler))
	e.GET("/test", controllers.Healthy)

	v1 := e.Group("/v1")

	auth := v1.Group("/auth", gin.BasicAuth(gin.Accounts{
		"zeus": "2019@win",
	}))
	auth.POST("/token", middleware.JwtAuth().LoginHandler)

	api := v1.Group("/api")
	api.Use(middleware.JwtAuth().MiddlewareFunc())
	//demo
	userController := controllers.UserController{}
	api.GET("/info", userController.Info)
}
