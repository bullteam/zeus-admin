package controllers

import (
	"encoding/json"
	"github.com/gin-gonic/gin"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/service"
)

var menuService = service.MenuService{}

type MenuController struct {
	BaseController
}

// @Summary 菜单信息
// @Tags menu
// @Security ApiKeyAuth
// @Accept  json
// @Produce  json
// @Success 200 {array} model.User "{"code":200,"data":{"id":1,"name":"wutong"}}"
// @Failure 400 {string} json "{"code":10004,"msg": "用户信息不存在"}"
// @Router /v1/menus/:id [get]
func (m *MenuController) Get(c *gin.Context) {
	var gDto dto.GeneralGetDto
	if m.BindAndValidate(c, &gDto) {
		data := menuService.InfoOfId(gDto)
		//user not found
		if data.Id < 1 {
			fail(c, ErrNoRecord)
			return
		}
		resp(c, map[string]interface{}{
			"result": data,
		})
	}
}

// @Summary 菜单列表
// @Tags menu
// @Security ApiKeyAuth
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"result":[...],"total":1}}"
// @Router /v1/menus [get]
// List - r of crud
func (m *MenuController) List(c *gin.Context) {
	var menuDto dto.GeneralTreeDto
	if m.BindAndValidate(c, &menuDto) {
		data, total := menuService.List(menuDto)
		resp(c, map[string]interface{}{
			"result": data,
			"total":  total,
		})
	}
}

// @Summary 新增菜单
// @Tags menu
// @Security ApiKeyAuth
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1}}"
// @Router /v1/menus [post]
//Create - c of crud
func (m *MenuController) Create(c *gin.Context) {
	var menuDto dto.MenuCreateDto
	if m.BindAndValidate(c, &menuDto) {
		menu := menuService.Create(menuDto)
		if menu.Id > 0 {
			// insert operation log
			b, _ := json.Marshal(menuDto)
			orLogDto := dto.OperationLogDto{
				UserId:           int(c.Value("userId").(float64)),
				RequestUrl:       c.Request.RequestURI,
				OperationMethod:  c.Request.Method,
				Params:           string(b),
				Ip:               c.ClientIP(),
				IpLocation:       "", //TODO...待接入获取ip位置服务
				OperationResult:  "success",
				OperationSuccess: 1,
				OperationContent: "Create Menu",
			}
			_ = logService.InsertOperationLog(&orLogDto)
		}
		resp(c, map[string]interface{}{
			"result": menu,
		})
	}
}

// @Summary 编辑菜单
// @Tags menu
// @Security ApiKeyAuth
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1}}"
// @Router /v1/menus/:id [put]
// Edit - u of crud
func (u *MenuController) Edit(c *gin.Context) {
	var menuDto dto.MenuEditDto
	if u.BindAndValidate(c, &menuDto) {
		affected := menuService.Update(menuDto)
		if affected > 0 {
			// insert operation log
			b, _ := json.Marshal(menuDto)
			orLogDto := dto.OperationLogDto{
				UserId:           int(c.Value("userId").(float64)),
				RequestUrl:       c.Request.RequestURI,
				OperationMethod:  c.Request.Method,
				Params:           string(b),
				Ip:               c.ClientIP(),
				IpLocation:       "", //TODO...待接入获取ip位置服务
				OperationResult:  "success",
				OperationSuccess: 1,
				OperationContent: "Edit Menu",
			}
			_ = logService.InsertOperationLog(&orLogDto)
		}
		ok(c, "ok.UpdateDone")
	}
}

// @Summary 删除菜单
// @Tags menu
// @Security ApiKeyAuth
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1}}"
// @Router /v1/menus/:id [delete]
// Delete - d of crud
func (m *MenuController) Delete(c *gin.Context) {
	var menuDto dto.GeneralDelDto
	if m.BindAndValidate(c, &menuDto) {
		affected := menuService.Delete(menuDto)
		if affected <= 0 {
			if affected == -2 {
				fail(c, ErrHasSubRecord)
			} else {
				fail(c, ErrDelFail)
			}
			return
		}
		// insert operation log
		b, _ := json.Marshal(menuDto)
		orLogDto := dto.OperationLogDto{
			UserId:           int(c.Value("userId").(float64)),
			RequestUrl:       c.Request.RequestURI,
			OperationMethod:  c.Request.Method,
			Params:           string(b),
			Ip:               c.ClientIP(),
			IpLocation:       "", //TODO...待接入获取ip位置服务
			OperationResult:  "success",
			OperationSuccess: 1,
			OperationContent: "Delete Menu",
		}
		_ = logService.InsertOperationLog(&orLogDto)
		ok(c, "ok.DeletedDone")
	}
}
