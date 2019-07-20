package main

import (
	"zeus/cmd"
)

// @title Zeus 宙斯权限后台 API
// @version V0.1
// @description Zeus 宙斯权限后台
// @termsOfService http://swagger.io/terms/
// @contact.name API Support
// @contact.email support@bullteam.cn
// @license.name Apache 2.0
// @license.url http://www.apache.org/licenses/LICENSE-2.0.html
// @host 127.0.0.1:8012
// @BasePath /v1
// @securityDefinitions.apikey ApiKeyAuth
// @in header
// @name Authorization
func main() {
	cmd.Execute()
	//dao.Shutdown()
}
