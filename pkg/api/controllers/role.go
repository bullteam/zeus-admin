package controllers

import (
	"github.com/gin-gonic/gin"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/service"
)

var roleService = service.RoleService{}

type RoleController struct {
	BaseController
}

// @Tags Role
// @Summary 角色信息
// @Security ApiKeyAuth
// @Param id path int true "角色id"
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1,"name":"test"}}"
// @Router /roles/{id} [get]
func (r *RoleController) Get(c *gin.Context) {
	var gDto dto.GeneralGetDto
	if r.BindAndValidate(c, &gDto) {
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
}

// @Tags Role
// @Summary 角色列表[分页+搜索]
// @Security ApiKeyAuth
// @Param limit query int false "条数"
// @Param skip query int false "偏移量"
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"result":[...],"total":1}}"
// @Router /roles [get]
func (r *RoleController) List(c *gin.Context) {
	var listDto dto.GeneralListDto
	if r.BindAndValidate(c, &listDto) {
		data, total := roleService.List(listDto)
		resp(c, map[string]interface{}{
			"result": data,
			"total":  total,
		})
	}
}

// @Tags Role
// @Summary 新增角色
// @Security ApiKeyAuth
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1}}"
// @Router /roles [post]
func (r *RoleController) Create(c *gin.Context) {
	var roleDto dto.RoleCreateDto
	if r.BindAndValidate(c, &roleDto) {
		newRole, err := roleService.Create(roleDto)
		if err != nil {
			ErrAddFail.Moreinfo = err.Error()
			fail(c, ErrAddFail)
			ErrAddFail.Moreinfo = ""
			return
		}
		resp(c, map[string]interface{}{
			"result": newRole,
		})
	}
}

// @Summary 更新角色信息
// @Tags Role
// @Security ApiKeyAuth
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"result":[...],"total":1}}"
// @Router /roles/:id [put]
// Edit - u of crud
func (r *RoleController) Edit(c *gin.Context) {
	var roleDto dto.RoleEditDto
	if r.BindAndValidate(c, &roleDto) {
		affected := roleService.Update(roleDto)
		if affected < 0 {
			fail(c, ErrNoRecord)
			return
		}
		ok(c, "ok.UpdateDone")
	}
}

// @Summary 删除角色信息
// @Tags Role
// @Security ApiKeyAuth
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"result":[...],"total":1}}"
// @Router /roles/:id [delete]
// Delete - d of crud
func (r *RoleController) Delete(c *gin.Context) {
	var roleDto dto.GeneralDelDto
	if r.BindAndValidate(c, &roleDto) {
		if roleService.Delete(roleDto) < 1 {
			fail(c, ErrNoRecord)
			return
		}
		ok(c, "ok.DeleteDone")
	}
}
