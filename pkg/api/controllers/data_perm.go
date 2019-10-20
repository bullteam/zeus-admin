package controllers

import (
	"encoding/json"
	"github.com/gin-gonic/gin"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/service"
)

var dataPermService = service.DataPermService{}

type DatePermController struct {
	BaseController
}

// Show data permission
// @Tags DataPerm
// @Summary 数据权限详情
// @Security ApiKeyAuth
// @Produce  json
// @Param id path string true "数据权限id"
// @Success 200 {string} json "{"code":200,"data":{"id":1,"name":"test"}}"
// @Router /v1/datas/{id} [get]
func (d *DatePermController) Get(c *gin.Context) {
	var gDto dto.GeneralGetDto
	if d.BindAndValidate(c, &gDto) {
		data := dataPermService.InfoOfId(gDto)
		if data.Id < 1 {
			fail(c, ErrNoRecord)
			return
		}
		resp(c, map[string]interface{}{
			"result": data,
		})
	}
}

// List data permission
// @Tags DataPerm
// @Summary 数据权限列表[分页+搜索]
// @Security ApiKeyAuth
// @Produce  json
// @Param limit query int false "条数"
// @Param skip query int false "偏移量"
// @Success 200 {string} json "{"code":200,"data":{"result":[...],"total":1}}"
// @Router /v1/datas [get]
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

// Create data permission
// @Tags DataPerm
// @Summary 新增数据权限
// @Security ApiKeyAuth
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1}}"
// @Router /v1/datas [post]
func (d *DatePermController) Create(c *gin.Context) {
	var dataPermAddDto dto.DataPermAddDto
	if d.BindAndValidate(c, &dataPermAddDto) {
		created := dataPermService.Create(dataPermAddDto)
		if created.Id <= 0 {
			fail(c, ErrAddFail)
			return
		}
		// insert operation log
		b, _ := json.Marshal(dataPermAddDto)
		orLogDto := dto.OperationLogDto{
			UserId:           int(c.Value("userId").(float64)),
			RequestUrl:       c.Request.RequestURI,
			OperationMethod:  c.Request.Method,
			Params:           string(b),
			Ip:               c.ClientIP(),
			IpLocation:       "", //TODO...待接入获取ip位置服务
			OperationResult:  "success",
			OperationSuccess: 1,
			OperationContent: "Create Data Permission",
		}
		_ = logService.InsertOperationLog(&orLogDto)
		resp(c, map[string]interface{}{
			"id": created.Id,
		})
	}
}

// Delete data permission
// @Tags DataPerm
// @Summary 删除项目
// @Security ApiKeyAuth
// @Param id path string true "要删除的id"
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1}}"
// @Router /v1/datas/{id} [delete]
func (d *DatePermController) Delete(c *gin.Context) {
	var dataPermDelDto dto.GeneralDelDto
	if d.BindAndValidate(c, &dataPermDelDto) {
		affected := dataPermService.Delete(dataPermDelDto)
		if affected <= 0 {
			fail(c, ErrDelFail)
			return
		}
		// insert operation log
		b, _ := json.Marshal(dataPermDelDto)
		orLogDto := dto.OperationLogDto{
			UserId:           int(c.Value("userId").(float64)),
			RequestUrl:       c.Request.RequestURI,
			OperationMethod:  c.Request.Method,
			Params:           string(b),
			Ip:               c.ClientIP(),
			IpLocation:       "", //TODO...待接入获取ip位置服务
			OperationResult:  "success",
			OperationSuccess: 1,
			OperationContent: "Delete Data Permission",
		}
		_ = logService.InsertOperationLog(&orLogDto)
		ok(c, "ok.DeletedDone")
	}
}

// Edit data permission
// @Tags DataPerm
// @Summary 编辑数据权限
// @Security ApiKeyAuth
// @Produce  json
// @Param id path int true "需要编辑的id"
// @Success 200 {string} json "{"code":200,"data":{"id":1}}"
// @Router /v1/datas/{id} [put]
func (d *DatePermController) Edit(c *gin.Context) {
	var dataPermEditDto dto.DataPermEditDto
	if d.BindAndValidate(c, &dataPermEditDto) {
		affected := dataPermService.Update(dataPermEditDto)
		if affected > 0 {
			// insert operation log
			b, _ := json.Marshal(dataPermEditDto)
			orLogDto := dto.OperationLogDto{
				UserId:           int(c.Value("userId").(float64)),
				RequestUrl:       c.Request.RequestURI,
				OperationMethod:  c.Request.Method,
				Params:           string(b),
				Ip:               c.ClientIP(),
				IpLocation:       "", //TODO...待接入获取ip位置服务
				OperationResult:  "success",
				OperationSuccess: 1,
				OperationContent: "Edit Data Permission",
			}
			_ = logService.InsertOperationLog(&orLogDto)
		}
		ok(c, "ok.UpdateDone")
	}
}
