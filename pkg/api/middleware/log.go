package middleware

import (
	"encoding/json"
	"github.com/gin-gonic/gin"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/log"
	"zeus/pkg/api/service"
)
var logService = service.LogService{}

func AccessLog(c *gin.Context)  {
	b, _ := json.Marshal(c.Request.URL.Query())
	uid := 0
	if c.Value("userId") != nil {
		uid = int(c.Value("userId").(float64))
	}
	orLogDto := dto.OperationLogDto{
		UserId:           uid,
		RequestUrl:       c.Request.URL.Path,
		OperationMethod:  c.Request.Method,
		Params:           string(b),
		Ip:               c.ClientIP(),
		IpLocation:       "", //TODO...待接入获取ip位置服务
		OperationResult:  "success",
		OperationSuccess: 1,
		OperationContent: "-",
	}
	err := logService.InsertOperationLog(&orLogDto)
	if err != nil {
		log.Error(err.Error())
	}
	c.Next()
}