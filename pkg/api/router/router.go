package router

import (
	"github.com/appleboy/gin-jwt/v2"
	"github.com/gin-gonic/gin"
	"github.com/spf13/viper"
	"github.com/swaggo/gin-swagger"
	"github.com/swaggo/gin-swagger/swaggerFiles"
	_ "zeus/docs"
	"zeus/pkg/api/controllers"
	"zeus/pkg/api/domain/account"
	"zeus/pkg/api/middleware"
)

var jwtAuth *jwt.GinJWTMiddleware
var jwtAuths *jwt.GinJWTMiddleware

func SetUp(e *gin.Engine, cors bool) {
	e.Use(
		gin.Recovery(),
	)
	if cors {
		e.Use(middleware.Cors())
	}
	e.Use(middleware.SetLangVer())
	e.GET("/swagger/*any", ginSwagger.WrapHandler(swaggerFiles.Handler))
	e.GET("/healthcheck", controllers.Healthy)

	//version fragment
	v1 := e.Group("/v1")

	//install
	InstallController := controllers.InstallController{}
	v1.POST("/install", InstallController.Install)
	v1.GET("/install/isLock", InstallController.IsLock)

	jwtAuth = middleware.JwtAuth(account.LoginStandard)
	//authController := &controllers.AuthController{}
	//api handlers
	v1.POST("/users/login", jwtAuth.LoginHandler)
	v1.POST("/users/login/refresh", jwtAuth.RefreshHandler)
	// oauth login
	jwtAuths = middleware.JwtAuth(account.LoginOAuth)
	v1.POST("/users/login/oauth", jwtAuths.LoginHandler)
	// ldap login
	jwtAuths = middleware.JwtAuth(account.LoginLdap)
	v1.POST("/users/login/ldap", jwtAuths.LoginHandler)

	v1.Use(jwtAuths.MiddlewareFunc(), middleware.JwtPrepare)
	v1.Use(jwtAuth.MiddlewareFunc(), middleware.JwtPrepare)
	userController := &controllers.UserController{}
	accountController := &controllers.AccountController{}

	//sdk related
	v1.GET("/user/perm/list", userController.GetDomainPermissions)
	v1.POST("/user/perm/check", userController.DomainPermCheck)
	v1.GET("/user/menu", userController.GetDomainMenus)

	//account - login user
	v1.GET("/account/info", accountController.Info)
	v1.GET("/account/permissions", accountController.GetPermissionsWithMenu)
	v1.PUT("/account/password", accountController.EditPassword)
	v1.GET("/account/domains", accountController.GetDomains)
	v1.POST("/account/bind-google-2fa-code", accountController.BindGoogle2faCode)
	v1.POST("/account/third-bind", accountController.Thirdbind)
	v1.POST("/account/third-unbind", accountController.ThirdUnbind)
	v1.GET("/account/thirds", accountController.ThirdList)
	v1.POST("/account/send-verify-email", accountController.SendVerifymail)
	v1.GET("/account/active", accountController.EmailVerify)
	v1.GET("/account/security", accountController.AccountInfo)
	v1.POST("/account/bindcode", accountController.BindGoogle2faCode)
	v1.POST("/account/close2fa", accountController.Close2fa)
	v1.POST("/account/check-google-2fa-code", accountController.CheckGoogle2faCode)
	v1.GET("/account/find-code-open", accountController.FindCodeOpen) // is check google 2fa code
	v1.POST("/account/ldap-adduser", accountController.LdapAddUser)   // add ldap user

	v1.Use(middleware.PermCheck)
	//user
	v1.GET("/users", userController.List)
	v1.GET("/users/:id", userController.Get)
	//v1.GET("/users/:id/permissions", userController.GetUserPermissionsWithMenu)
	v1.POST("/users", userController.Create)
	v1.PUT("/users/:id", userController.Edit)
	v1.PUT("/users/:id/status", userController.EditStatus)
	// v1.PUT("/users/:id/password", userController.EditPassword)
	v1.GET("/users/:id/roles", userController.Roles)

	v1.DELETE("/users/:id", userController.Delete)
	v1.POST("/users/department/move", userController.UpdateDepartment)

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
	v1.POST("/depts/:id/check-no-member", deptController.CheckNoMember)

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

	// Ldap & email setting
	settingController := controllers.SettingController{}
	v1.GET("/setting/ldap", settingController.LdapList)
	v1.POST("/setting/ldap", settingController.LdapUpdate)
	v1.GET("/setting/email", settingController.EmailList)
	v1.POST("/setting/email", settingController.EmailUpdate)
	v1.GET("/setting/sync/dingtalk", settingController.SyncDingtalk)

	if viper.GetBool("project.merge") {
		e.LoadHTMLGlob("./pkg/webui/dist/*.html") // 添加入口index.html
		//e.LoadHTMLFiles("./pkg/webui/dist/static/*/*")   // 添加资源路径
		e.Static("/static", "./pkg/webui/dist/static")   // 添加资源路径
		e.StaticFile("/", "./pkg/webui/dist/index.html") //前端接口
	}
}
