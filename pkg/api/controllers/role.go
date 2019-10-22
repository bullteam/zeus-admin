package controllers

import (
	"encoding/json"
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
// @Router /v1/roles/{id} [get]
func (r *RoleController) Get(c *gin.Context) {
	var gDto dto.GeneralGetDto
	if r.BindAndValidate(c, &gDto) {
		data := roleService.InfoOfId(gDto)
		//role not found
		if data.Id < 1 {
			fail(c, ErrNoRecord)
			return
		}
		// todo: get feature permission list
		// data permission list
		dataPerms, _ := roleService.GetRoleDataPermsByRoleId(data.Id)
		resp(c, map[string]interface{}{
			"result": map[string]interface{}{
				"detail":     data,
				"data_perms": dataPerms,
			},
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
// @Router /v1/roles [get]
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
// @Router /v1/roles [post]
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
		// insert operation log
		b, _ := json.Marshal(roleDto)
		orLogDto := dto.OperationLogDto{
			UserId:           int(c.Value("userId").(float64)),
			RequestUrl:       c.Request.RequestURI,
			OperationMethod:  c.Request.Method,
			Params:           string(b),
			Ip:               c.ClientIP(),
			IpLocation:       "", //TODO...待接入获取ip位置服务
			OperationResult:  "success",
			OperationSuccess: 1,
			OperationContent: "Create Role",
		}
		_ = logService.InsertOperationLog(&orLogDto)
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
// @Router /v1/roles/:id [put]
// Edit - u of crud
func (r *RoleController) Edit(c *gin.Context) {
	var roleDto dto.RoleEditDto
	if r.BindAndValidate(c, &roleDto) {
		affected := roleService.Update(roleDto)
		if affected < 0 {
			fail(c, ErrNoRecord)
			return
		}
		// insert operation log
		b, _ := json.Marshal(roleDto)
		orLogDto := dto.OperationLogDto{
			UserId:           int(c.Value("userId").(float64)),
			RequestUrl:       c.Request.RequestURI,
			OperationMethod:  c.Request.Method,
			Params:           string(b),
			Ip:               c.ClientIP(),
			IpLocation:       "", //TODO...待接入获取ip位置服务
			OperationResult:  "success",
			OperationSuccess: 1,
			OperationContent: "Edit Role",
		}
		_ = logService.InsertOperationLog(&orLogDto)
		ok(c, "ok.UpdateDone")
	}
}

// @Summary 删除角色信息
// @Tags Role
// @Security ApiKeyAuth
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"result":[...],"total":1}}"
// @Router /v1/roles/:id [delete]
// Delete - d of crud
func (r *RoleController) Delete(c *gin.Context) {
	var roleDto dto.GeneralDelDto
	if r.BindAndValidate(c, &roleDto) {
		if roleService.Delete(roleDto) < 1 {
			fail(c, ErrNoRecord)
			return
		}
		// insert operation log
		b, _ := json.Marshal(roleDto)
		orLogDto := dto.OperationLogDto{
			UserId:           int(c.Value("userId").(float64)),
			RequestUrl:       c.Request.RequestURI,
			OperationMethod:  c.Request.Method,
			Params:           string(b),
			Ip:               c.ClientIP(),
			IpLocation:       "", //TODO...待接入获取ip位置服务
			OperationResult:  "success",
			OperationSuccess: 1,
			OperationContent: "Delete Role",
		}
		_ = logService.InsertOperationLog(&orLogDto)
		ok(c, "ok.DeleteDone")
	}
}
