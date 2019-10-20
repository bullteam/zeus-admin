package controllers

import (
	"encoding/json"
	"github.com/gin-gonic/gin"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/service"
)

var domainService = service.DomainService{}

type DomainController struct {
	BaseController
}

// @Tags Domain
// @Summary 项目信息
// @Security ApiKeyAuth
// @Param id path int true "项目id"
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1,"name":"test"}}"
// @Router /v1/domains/{id} [get]
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

// @Tags Domain
// @Summary 项目列表[分页+搜索]
// @Security ApiKeyAuth
// @Param limit query int false "条数"
// @Param skip query int false "偏移量"
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"result":[...],"total":1}}"
// @Router /v1/domains [get]
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

// @Tags Domain
// @Summary 新增项目
// @Security ApiKeyAuth
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1}}"
// @Router /v1/domains [post]
func (d *DomainController) Create(c *gin.Context) {
	var domainDto dto.DomainCreateDto
	if d.BindAndValidate(c, &domainDto) {
		created := domainService.Create(domainDto)
		if created.Id <= 0 {
			fail(c, ErrAddFail)
			return
		}
		// insert operation log
		b, _ := json.Marshal(domainDto)
		orLogDto := dto.OperationLogDto{
			UserId:           int(c.Value("userId").(float64)),
			RequestUrl:       c.Request.RequestURI,
			OperationMethod:  c.Request.Method,
			Params:           string(b),
			Ip:               c.ClientIP(),
			IpLocation:       "", //TODO...待接入获取ip位置服务
			OperationResult:  "success",
			OperationSuccess: 1,
			OperationContent: "Create Domain",
		}
		_ = logService.InsertOperationLog(&orLogDto)
		resp(c, map[string]interface{}{
			"id": created.Id,
		})
	}
}

// @Tags Domain
// @Summary 删除项目
// @Security ApiKeyAuth
// @Param id path int true "项目id"
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1}}"
// @Router /v1/domains/{id} [delete]
func (d *DomainController) Delete(c *gin.Context) {
	var domainDto dto.GeneralDelDto
	if d.BindAndValidate(c, &domainDto) {
		affected := domainService.Delete(domainDto)
		if affected <= 0 {
			fail(c, ErrDelFail)
			return
		}
		// insert operation log
		b, _ := json.Marshal(domainDto)
		orLogDto := dto.OperationLogDto{
			UserId:           int(c.Value("userId").(float64)),
			RequestUrl:       c.Request.RequestURI,
			OperationMethod:  c.Request.Method,
			Params:           string(b),
			Ip:               c.ClientIP(),
			IpLocation:       "", //TODO...待接入获取ip位置服务
			OperationResult:  "success",
			OperationSuccess: 1,
			OperationContent: "Delete Domain",
		}
		_ = logService.InsertOperationLog(&orLogDto)
		ok(c, "ok.DeletedDone")
	}
}

// @Tags Domain
// @Summary 编辑项目
// @Security ApiKeyAuth
// @Param id path int true "项目id"
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1}}"
// @Router /v1/domains/{id} [put]
func (d *DomainController) Edit(c *gin.Context) {
	var domainDto dto.DomainEditDto
	if d.BindAndValidate(c, &domainDto) {
		affected := domainService.Update(domainDto)
		if affected > 0 {
			// insert operation log
			b, _ := json.Marshal(domainDto)
			orLogDto := dto.OperationLogDto{
				UserId:           int(c.Value("userId").(float64)),
				RequestUrl:       c.Request.RequestURI,
				OperationMethod:  c.Request.Method,
				Params:           string(b),
				Ip:               c.ClientIP(),
				IpLocation:       "", //TODO...待接入获取ip位置服务
				OperationResult:  "success",
				OperationSuccess: 1,
				OperationContent: "Edit Domain",
			}
			_ = logService.InsertOperationLog(&orLogDto)
		}
		ok(c, "ok.UpdateDone")
	}
}
