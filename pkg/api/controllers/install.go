package controllers

import (
	"github.com/gin-gonic/gin"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/service"
)

type InstallController struct {
	BaseController
}

var InstallService = service.InstallService{}

func (i *InstallController) Install(c *gin.Context) {
	var InstallDTO dto.InstallDTO
	if i.BindAndValidate(c, &InstallDTO) {
		ret := InstallService.Install(InstallDTO)
		if !ret {
			fail(c, ErrInstall)
			return
		}
	}
	resp(c, map[string]interface{}{
		"result": InstallDTO,
	})
}
