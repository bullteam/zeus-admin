package controllers

import (
	"github.com/gin-gonic/gin"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/service"
)

type InstallController struct {
	BaseController
}

var installService = service.InstallService{}

func (i *InstallController) Install(c *gin.Context) {
	var InstallDTO dto.InstallDTO
	if i.BindAndValidate(c, &InstallDTO) {
		ret := installService.Install(InstallDTO)
		if !ret {
			fail(c, ErrInstall)
			return
		}
	}
	resp(c, map[string]interface{}{
		"result": InstallDTO,
	})
}

func (i *InstallController) IsLock(c *gin.Context) {
	isLock := installService.Islock()
	resp(c, map[string]interface{}{
		"result": isLock,
	})
}
