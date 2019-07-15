package controllers

import (
	"github.com/gin-gonic/gin"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/service"
)

var deptService = service.DeptService{}

type DeptController struct {
	BaseController
}

// @Summary 部门信息
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1,"name":"test"}}"
// @Router /v1/depts/:id [get]
func (d *DeptController) Get(c *gin.Context) {
	var gDto dto.GeneralGetDto
	if d.BindAndValidate(c, &gDto) {
		data := deptService.InfoOfId(gDto)
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

// @Summary 部门列表[分页+搜索]
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"result":[...],"total":1}}"
// @Router /v1/depts?limit=20&offset=0 [get]
// List - r of crud
func (d *DeptController) List(c *gin.Context) {
	var listDto dto.GeneralListDto
	if d.BindAndValidate(c, &listDto) {
		data, total := deptService.List(listDto)
		resp(c, map[string]interface{}{
			"result": data,
			"total":  total,
		})
	}
}

// @Summary 新增应用
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1}}"
// @Router /v1/depts?limit=20&offset=0 [get]
//Create - c of crud
func (d *DeptController) Create(c *gin.Context) {
	var deptDto dto.DeptCreateDto
	if d.BindAndValidate(c, &deptDto) {
		created := deptService.Create(deptDto)
		if created.Id <= 0 {
			fail(c, ErrAddFail)
		}
		resp(c, map[string]interface{}{
			"id": created.Id,
		})
	}
}

// @Summary 删除部门
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1}}"
// @Router v1/depts/:id [delete]
//Create - d of crud
func (d *DeptController) Delete(c *gin.Context) {
	var deptDto dto.GeneralDelDto
	if d.BindAndValidate(c, &deptDto) {
		affected := deptService.Delete(deptDto)
		if affected <= 0 {
			fail(c, ErrDelFail)
			return
		}
		ok(c, "ok.DeletedDone")
	}
}

// @Summary 编辑部门
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1}}"
// @Router v1/depts/:id [put]
// Edit - u of crud
func (d *DeptController) Edit(c *gin.Context) {
	var deptDto dto.DeptEditDto
	if d.BindAndValidate(c, &deptDto) {
		affected := deptService.Update(deptDto)
		if affected <= 0 {
			//fail(c,ErrEditFail)
			//return
		}
		ok(c, "ok.UpdateDone")
	}
}
