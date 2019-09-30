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

// @Tags Department
// @Summary 部门信息
// @Security ApiKeyAuth
// @Param id path int true "部门id"
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1,"name":"test"}}"
// @Router /v1/depts/{id} [get]
func (d *DeptController) Get(c *gin.Context) {
	var gDto dto.GeneralGetDto
	if d.BindAndValidate(c, &gDto) {
		data := deptService.InfoOfId(gDto)
		if data.Id < 1 {
			fail(c, ErrNoUser)
			return
		}
		resp(c, map[string]interface{}{
			"result": data,
		})
	}
}

// @Tags Department
// @Summary 部门列表[分页+搜索]
// @Security ApiKeyAuth
// @Param limit query int false "条数"
// @Param skip query int false "偏移量"
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"result":[...],"total":1}}"
// @Router /v1/depts [get]
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

// @Tags Department
// @Summary 新增部门
// @Security ApiKeyAuth
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1}}"
// @Router /v1/depts [post]
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

// @Tags Department
// @Summary 删除部门
// @Security ApiKeyAuth
// @Param id path int true "部门id"
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1}}"
// @Router /v1/depts/{id} [delete]
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

// @Tags Department
// @Summary 编辑部门
// @Security ApiKeyAuth
// @Param id path int true "部门id"
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1}}"
// @Router /v1/depts/{id} [put]
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

// @Tags Department
// @Summary 检查部门下面是否有用户
// @Security ApiKeyAuth
// @Param id path int true "部门id"
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1}}"
// @Router /v1/depts/{id} [put]
func (d *DeptController) CheckNoMember(c *gin.Context) {
	var deptDto dto.GeneralDelDto
	if d.BindAndValidate(c, &deptDto) {
		data := deptService.CheckIfPeopleInside(deptDto)
		if data > 0 {
			fail(c, ErrDeptHasMember)
			return
		}
		resp(c, map[string]interface{}{
			"result": data,
		})
	}
}
