package router

import (
	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
	"github.com/swaggo/gin-swagger"
	"github.com/swaggo/gin-swagger/swaggerFiles"
	_ "zeus/docs"
	"zeus/pkg/api/controllers"
	"zeus/pkg/api/middleware"
)

func Init(e *gin.Engine) {
	e.Use(
		gin.Recovery(),
	)
	e.Use(cors.Default()) // CORS
	e.Use(middleware.SetLangVer())
	e.GET("/swagger/*any", ginSwagger.WrapHandler(swaggerFiles.Handler))
	e.GET("/test", controllers.Healthy)
	//version fragment
	v1 := e.Group("/v1")
	jwtAuth := middleware.JwtAuth()
	//auth.POST("/token", jwtAuth.LoginHandler)
	//auth.GET("/refresh_token", jwtAuth.RefreshHandler)

	//api handlers
	v1.POST("/users/login", jwtAuth.LoginHandler)
	v1.POST("/users/login/refresh", jwtAuth.RefreshHandler)

	v1.Use(jwtAuth.MiddlewareFunc(), middleware.JwtPrepare)
	userController := &controllers.UserController{}
	accountController := &controllers.AccountController{}

	//user
	v1.GET("/users", userController.List)
	v1.GET("/users/:id", userController.Get)
	v1.GET("/users/:id/permissions", userController.GetUserPermissions)
	v1.PUT("/users/:id", userController.Edit)
	v1.PUT("/users/:id/status", userController.EditStatus)
	v1.PUT("/users/:id/password", userController.EditPassword)
	v1.DELETE("/users/:id", userController.Delete)
	v1.POST("/users/department/move", userController.UpdateDepartment)
	//account - login user
	v1.GET("/account/info", accountController.Info)
	//update login user's password
	v1.PUT("/account/password", accountController.EditPassword)
	v1.GET("/account/domains", accountController.GetDomains)

	roleController := &controllers.RoleController{}
	//role
	v1.GET("/roles", roleController.List)
	v1.GET("/roles/:id", roleController.Get)
	v1.POST("/role", roleController.Create)

	//domain
	domainController := &controllers.DomainController{}
	v1.GET("/domains", domainController.List)
	v1.GET("/domains/:id", domainController.Get)
	v1.POST("/domains", domainController.Create)
	v1.DELETE("/domains/:id", domainController.Delete)

	//dept
	deptController := &controllers.DeptController{}
	v1.GET("/depts", deptController.List)
	v1.GET("/depts/:id", deptController.Get)
	v1.POST("/depts", deptController.Create)
	v1.DELETE("/depts/:id", deptController.Delete)

	// data permission
	dataPermController := &controllers.DatePermController{}
	v1.GET("/datas", dataPermController.List)
	v1.GET("/datas/:id", dataPermController.Get)
	v1.POST("/datas", dataPermController.Create)
	v1.PUT("/datas/:id", dataPermController.Edit)
	v1.DELETE("/datas/:id", dataPermController.Delete)
}
