package controllers

import (
	"github.com/gin-gonic/gin"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/service"
)

var logService = service.LogService{}

type LogController struct {
	BaseController
}

// @Summary 登录日志信息
// @Tags Log
// @Security ApiKeyAuth
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1,"name":"test"}}"
// @Router /v1/log/login/{logId} [get]
func (LogController) LoginLogDetail(c *gin.Context) {
	logId := int(c.Value("id").(float64))
	data := logService.LoginLogInfoOfId(dto.GeneralGetDto{Id: logId})
	resp(c, map[string]interface{}{
		"result": data,
	})
}

// @Summary 登录日志列表
// @Tags Log
// @Security ApiKeyAuth
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1,"name":"test"}}"
// @Router /v1/log/login [get]
func (LogController) LoginLogLists(c *gin.Context) {
	var listDto dto.LoginLogListDto
	_ = dto.Bind(c, &listDto)
	data, total := logService.LoginLogLists(listDto)
	resp(c, map[string]interface{}{
		"total":  total,
		"result": data,
	})
}

// @Summary 操作日志信息
// @Tags Log
// @Security ApiKeyAuth
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1,"name":"test"}}"
// @Router /v1/log/operation [get]
func (LogController) OperationLogDetail(c *gin.Context) {
	logId := int(c.Value("id").(float64))
	data := logService.OperationLogInfoOfId(dto.GeneralGetDto{Id: logId})
	resp(c, map[string]interface{}{
		"result": data,
	})
}

// @Summary 操作日志列表
// @Tags Log
// @Security ApiKeyAuth
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1,"name":"test"}}"
// @Router /v1/log/operation/{logId} [get]
func (LogController) OperationLogLists(c *gin.Context) {
	var listDto dto.OperationLogListDto
	_ = dto.Bind(c, &listDto)
	data, total := logService.OperationLogLists(listDto)
	resp(c, map[string]interface{}{
		"total":  total,
		"result": data,
	})
}
