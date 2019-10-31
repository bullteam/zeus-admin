package middleware

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"strings"
	"zeus/pkg/api/log"
)

// PermCheck - check permission
func PermCheck(c *gin.Context) {
	route := strings.Split(c.Request.URL.RequestURI(), "?")[0]
	for _, p := range c.Params {
		route = strings.Replace(route, "/"+p.Value, "/:"+p.Key, 1)
	}
	route = route + "|" + strings.ToLower(c.Request.Method)
	uid := fmt.Sprintf("%s", c.Value("userId"))
	if !accountService.CheckPermission(uid, "root", route) {
		log.Warn(fmt.Sprintf("No permission for %s", route))
		//c.JSON(http.StatusOK,gin.H{
		//	"code": 403,
		//	"msg": i18n.Tr(GetLang(),"err.Err403"),
		//})
		//c.Abort()
		//return
	}
	c.Next()
}
