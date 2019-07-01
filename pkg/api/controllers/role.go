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

// @Summary 角色列表[分页+搜索]
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"result":[...],"total":1}}"
// @Router /v1/api/roles?limit=20&offset=0 [get]
// List - r of crud
func (u RoleController) List(c *gin.Context) {
	var listDto dto.GeneralListDto
	_ = dto.Bind(c, &listDto)
	data, total := roleService.List(listDto)
	resp(c, map[string]interface{}{
		"result": data,
		"total":  total,
	})
}