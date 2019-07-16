package controllers

import (
	"github.com/gin-gonic/gin"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/service"
)

var dataPermService = service.DataPermService{}

type DatePermController struct {
	BaseController
}

// @Summary 数据权限详情
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1,"name":"test"}}"
// @Router /v1/datas/:id [get]
func (d *DatePermController) Get(c *gin.Context) {
	var gDto dto.GeneralGetDto
	if d.BindAndValidate(c, &gDto) {
		data := dataPermService.InfoOfId(gDto)
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

// @Summary 数据权限列表[分页+搜索]
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"result":[...],"total":1}}"
// @Router /v1/domains?limit=20&skip=0 [get]
// List - r of crud
func (d *DatePermController) List(c *gin.Context) {
	var listDto dto.GeneralListDto
	if d.BindAndValidate(c, &listDto) {
		data, total := dataPermService.List(listDto)
		resp(c, map[string]interface{}{
			"result": data,
			"total":  total,
		})
	}
}

// @Summary 新增数据权限
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1}}"
// @Router /v1/datas [post]
//Create - c of crud
func (d *DatePermController) Create(c *gin.Context) {
	var dataPermAddDto dto.DataPermAddDto
	if d.BindAndValidate(c, &dataPermAddDto) {
		created := dataPermService.Create(dataPermAddDto)
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
// @Router v1/datas/:id [delete]
//Create - d of crud
func (d *DatePermController) Delete(c *gin.Context) {
	var dataPermDelDto dto.GeneralDelDto
	if d.BindAndValidate(c, &dataPermDelDto) {
		affected := dataPermService.Delete(dataPermDelDto)
		if affected <= 0 {
			fail(c, ErrDelFail)
			return
		}
		ok(c, "ok.DeletedDone")
	}
}

// @Summary 编辑数据权限
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1}}"
// @Router v1/datas/:id [put]
// Edit - u of crud
func (d *DatePermController) Edit(c *gin.Context) {
	var dataPermEditDto dto.DataPermEditDto
	if d.BindAndValidate(c, &dataPermEditDto) {
		affected := dataPermService.Update(dataPermEditDto)
		if affected <= 0 {
			//fail(c,ErrEditFail)
			//return
		}
		ok(c, "ok.UpdateDone")
	}
}
