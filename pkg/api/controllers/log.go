package controllers

import (
	"github.com/gin-gonic/gin"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/service"
)

var logService = service.LogService{}

type LogController struct {
}

// @Summary 登录日志信息
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1,"name":"test"}}"
// @Router /v1/api/users/info [get]
func (LogController) LoginLogDetail(c *gin.Context) {
	logId := int(c.Value("id").(float64))
	data := logService.LoginLogDetail(dto.GeneralGetDto{Id: logId})
	resp(c, map[string]interface{}{
		"result": data,
	})
}


// @Summary 登录日志信息
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1,"name":"test"}}"
// @Router /v1/api/users/info [get]
func (LogController) LoginLogLists(c *gin.Context) {
	var listDto dto.GeneralListDto
	_ = dto.Bind(c, &listDto)
	data, total := logService.LoginLogLists(listDto)
	resp(c, map[string]interface{}{
		"total": total,
		"result": data,
	})
}


// @Summary 登录日志信息
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1,"name":"test"}}"
// @Router /v1/api/users/info [get]
func (LogController) OperationLogDetail(c *gin.Context) {
	logId := int(c.Value("id").(float64))
	data := logService.OperationLogDetail(dto.GeneralGetDto{Id: logId})
	resp(c, map[string]interface{}{
		"result": data,
	})
}


// @Summary 登录日志信息
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1,"name":"test"}}"
// @Router /v1/api/users/info [get]
func (LogController) OperationLogLists(c *gin.Context) {
	var listDto dto.GeneralListDto
	_ = dto.Bind(c, &listDto)
	data, total := logService.OperationLogLists(listDto)
	resp(c, map[string]interface{}{
		"total": total,
		"result": data,
	})
}

