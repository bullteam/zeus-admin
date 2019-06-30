package controllers

import (
	"github.com/gin-gonic/gin"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/service"
)

var roleService = service.RoleService{}

type RoleController struct {

}

// @Summary 角色信息
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1,"name":"test"}}"
// @Router /v1/api/roles/:id [get]
func (u RoleController) Get(c *gin.Context) {
	var gDto dto.GeneralGetDto
	if err := dto.Bind(c, &gDto); err != nil {
		failValidate(c, err.Error())
		return
	}
	data := roleService.InfoOfId(gDto)
	//role not found
	if data.Id < 1 {
		fail(c, ErrNoUser)
		return
	}
	resp(c, map[string]interface{}{
		"result": data,
	})
}