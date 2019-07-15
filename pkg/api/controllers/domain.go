package controllers

import (
	"github.com/gin-gonic/gin"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/service"
)

var domainService = service.DomainService{}

type DomainController struct {
	BaseController
}

// @Summary 项目信息
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1,"name":"test"}}"
// @Router /v1/domains/:id [get]
func (d *DomainController) Get(c *gin.Context) {
	var gDto dto.GeneralGetDto
	if d.BindAndValidate(c, &gDto) {
		data := domainService.InfoOfId(gDto)
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

// @Summary 项目列表[分页+搜索]
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"result":[...],"total":1}}"
// @Router /v1/domains?limit=20&offset=0 [get]
// List - r of crud
func (d *DomainController) List(c *gin.Context) {
	var listDto dto.GeneralListDto
	if d.BindAndValidate(c, &listDto) {
		data, total := domainService.List(listDto)
		resp(c, map[string]interface{}{
			"result": data,
			"total":  total,
		})
	}
}

// @Summary 新增应用
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1}}"
// @Router /v1/domains?limit=20&offset=0 [get]
//Create - c of crud
func (d *DomainController) Create(c *gin.Context) {
	var domainDto dto.DomainCreateDto
	if d.BindAndValidate(c, &domainDto) {
		created := domainService.Create(domainDto)
		if created.Id <= 0 {
			fail(c, ErrAddFail)
		}
		resp(c, map[string]interface{}{
			"id": created.Id,
		})
	}
}

// @Summary 删除项目
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1}}"
// @Router v1/domains/:id [delete]
//Create - d of crud
func (d *DomainController) Delete(c *gin.Context) {
	var domainDto dto.GeneralDelDto
	if d.BindAndValidate(c, &domainDto) {
		affected := domainService.Delete(domainDto)
		if affected <= 0 {
			fail(c, ErrDelFail)
			return
		}
		ok(c, "ok.DeletedDone")
	}
}

// @Summary 编辑项目
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1}}"
// @Router v1/domains/:id [put]
// Edit - u of crud
func (d *DomainController) Edit(c *gin.Context) {
	var domainDto dto.DomainEditDto
	if d.BindAndValidate(c, &domainDto) {
		affected := domainService.Update(domainDto)
		if affected <= 0 {
			//fail(c,ErrEditFail)
			//return
		}
		ok(c, "ok.UpdateDone")
	}
}
