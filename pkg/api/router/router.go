package router

import (
	"github.com/appleboy/gin-jwt/v2"
	"github.com/gin-gonic/gin"
	"github.com/swaggo/gin-swagger"
	"github.com/swaggo/gin-swagger/swaggerFiles"
	_ "zeus/docs"
	"zeus/pkg/api/controllers"
	"zeus/pkg/api/domain/account"
	"zeus/pkg/api/middleware"
)

var jwtAuth *jwt.GinJWTMiddleware
var jwtAuths *jwt.GinJWTMiddleware

func Init(e *gin.Engine) {
	e.Use(
		gin.Recovery(),
	)
	//e.Use(cors.Default()) // CORS
	e.Use(middleware.SetLangVer())
	e.GET("/swagger/*any", ginSwagger.WrapHandler(swaggerFiles.Handler))
	e.GET("/healthcheck", controllers.Healthy)
	//version fragment
	v1 := e.Group("/v1")
	jwtAuth = middleware.JwtAuth(account.LoginStandard.Type)
	//authController := &controllers.AuthController{}
	//api handlers
	v1.POST("/users/login", jwtAuth.LoginHandler)
	v1.POST("/users/login/refresh", jwtAuth.RefreshHandler)
	jwtAuths = middleware.JwtAuth(account.LoginOAuth.Type)
	v1.POST("/users/login/oauth", jwtAuths.LoginHandler)

	v1.Use(jwtAuths.MiddlewareFunc(), middleware.JwtPrepare)
	v1.Use(jwtAuth.MiddlewareFunc(), middleware.JwtPrepare)
	userController := &controllers.UserController{}
	accountController := &controllers.AccountController{}

	//user
	v1.GET("/users", userController.List)
	v1.GET("/users/:id", userController.Get)
	v1.GET("/users/:id/permissions", userController.GetUserPermissions)
	v1.POST("/users", userController.Create)
	v1.PUT("/users/:id", userController.Edit)
	v1.PUT("/users/:id/status", userController.EditStatus)
	// v1.PUT("/users/:id/password", userController.EditPassword)
	v1.GET("/users/:id/roles", userController.Roles)

	v1.DELETE("/users/:id", userController.Delete)
	v1.POST("/users/department/move", userController.UpdateDepartment)

	//account - login user
	v1.GET("/account/info", accountController.Info)
	v1.GET("/account/permissions", accountController.GetPermissions)
	v1.PUT("/account/password", accountController.EditPassword)
	v1.GET("/account/domains", accountController.GetDomains)
	v1.POST("/account/bind-google-2fa-code", accountController.BindGoogle2faCode)
	v1.POST("/account/third-bind", accountController.Thirdbind)
	v1.POST("/account/third-unbind", accountController.ThirdUnbind)
	v1.GET("/account/thirds", accountController.ThirdList)
	v1.POST("/account/verify-email", accountController.Verifymail)
	v1.GET("/account/email-verify", accountController.EmailVerify)
	v1.GET("/account/security", accountController.AccountInfo)
	v1.POST("/account/bindcode", accountController.BindGoogle2faCode)
	v1.POST("/account/close2fa", accountController.Close2fa)
	v1.POST("account/check-google-2fa-code", accountController.CheckGoogle2faCode)
	v1.GET("account/find-code-open", accountController.FindCodeOpen) // is check google 2fa code

	//role
	roleController := &controllers.RoleController{}
	v1.GET("/roles", roleController.List)
	v1.GET("/roles/:id", roleController.Get)
	v1.POST("/roles", roleController.Create)
	v1.PUT("/roles/:id", roleController.Edit)
	v1.DELETE("/roles/:id", roleController.Delete)
	//menu
	menuController := &controllers.MenuController{}
	v1.GET("/menus", menuController.List)
	v1.GET("/menus/:id", menuController.Get)
	v1.POST("/menus", menuController.Create)
	v1.PUT("/menus/:id", menuController.Edit)
	v1.DELETE("/menus/:id", menuController.Delete)
	//domain
	domainController := &controllers.DomainController{}
	v1.GET("/domains", domainController.List)
	v1.GET("/domains/:id", domainController.Get)
	v1.POST("/domains", domainController.Create)
	v1.PUT("/domains/:id", domainController.Edit)
	v1.DELETE("/domains/:id", domainController.Delete)

	//dept
	deptController := &controllers.DeptController{}
	v1.GET("/depts", deptController.List)
	v1.GET("/depts/:id", deptController.Get)
	v1.POST("/depts", deptController.Create)
	v1.PUT("/depts/:id", deptController.Edit)
	v1.DELETE("/depts/:id", deptController.Delete)
	v1.POST("/depts/:id/check-no-member", deptController.Delete)

	// data permission
	dataPermController := &controllers.DatePermController{}
	v1.GET("/datas", dataPermController.List)
	v1.GET("/datas/:id", dataPermController.Get)
	v1.POST("/datas", dataPermController.Create)
	v1.PUT("/datas/:id", dataPermController.Edit)
	v1.DELETE("/datas/:id", dataPermController.Delete)

	logController := controllers.LogController{}
	//login log
	v1.GET("/log/logins", logController.LoginLogLists)
	v1.GET("/log/login/:id", logController.LoginLogDetail)

	//request log
	v1.GET("/log/operations", logController.OperationLogLists)
	v1.GET("/log/operations/:id", logController.OperationLogDetail)
}
