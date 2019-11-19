package controllers

import (
	"github.com/gin-gonic/gin"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/service"
)

type SettingController struct {
	BaseController
}

var settingService = service.SettingService{}

// @Tags Setting
// @Summary Ldap 设置
// @Security ApiKeyAuth
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":""}
// @Router /v1/setting/ldap [get]
func (s *SettingController) LdapList(c *gin.Context) {
	settings := settingService.GetLdap()
	resp(c, map[string]interface{}{
		"list": settings,
	})
}

// @Tags Setting
// @Summary Ldap 设置
// @Security ApiKeyAuth
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":""}
// @Router /v1/setting/ldap [post]

func (s *SettingController) LdapUpdate(c *gin.Context) {
	var SettingDTO dto.SettingDTO
	if s.BindAndValidate(c, &SettingDTO) {
		ret := settingService.LdapUpdate(SettingDTO)
		if !ret {
			fail(c, ErrInstall)
			return
		}
	}
	resp(c, map[string]interface{}{
		"result": SettingDTO,
	})
}

// @Tags Setting
// @Summary Email 设置
// @Security ApiKeyAuth
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":""}
// @Router /v1/setting/email [get]
func (s *SettingController) EmailList(c *gin.Context) {
	settings := settingService.GetEmail()
	resp(c, map[string]interface{}{
		"list": settings,
	})
}

// @Tags Setting
// @Summary Email 设置
// @Security ApiKeyAuth
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":""}
// @Router /v1/setting/email [post]
func (s *SettingController) EmailUpdate(c *gin.Context) {
	var EmailSettingDTO dto.EmailSettingDTO
	if s.BindAndValidate(c, &EmailSettingDTO) {
		ret := settingService.EmailUpdate(EmailSettingDTO)
		if !ret {
			fail(c, ErrInstall)
			return
		}
	}
	resp(c, map[string]interface{}{
		"result": EmailSettingDTO,
	})
}

// @Tags Department
// @Summary 同步钉钉部门信息
// @Security ApiKeyAuth
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":""}"
// @Router /v1/depts/sync/dingtalk [get]
func (d *SettingController) SyncDingtalk(c *gin.Context) {
	data := settingService.SyncDingtalk()
	resp(c, map[string]interface{}{
		"result": data,
	})
}
