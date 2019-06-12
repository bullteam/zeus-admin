package controllers

import (
	"github.com/gin-gonic/gin"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/service"
)

var userService = service.UserService{}

type UserController struct {
}

// @Summary 用户信息
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1,"name":"test"}}"
// @Router /v1/api/info [get]
func (u UserController) Info(c *gin.Context) {
	resp(c, gin.H{
		"id":   c.Value("userId"),
		"name": c.Value("userName"),
	})
}

// @Summary 用户列表[分页+搜索]
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"result":[...],"total":1}}"
// @Router /v1/api/users?limit=20&offset=0 [get]
// List - r of crud
func (u UserController) List(c *gin.Context) {
	var listDto dto.GeneralListDto
	dto.Bind(c, &listDto)
	data, total := userService.List(listDto)
	resp(c, map[string]interface{}{
		"result": data,
		"total":  total,
	})
}

// @Summary 新增用户
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1}}"
// @Router /v1/api/users?limit=20&offset=0 [get]
//Create - c of crud
func (u UserController) Create(c *gin.Context) {
	var userDto dto.UserCreateDto
	if err := dto.Bind(c, &userDto); err != nil {
		failValidate(c, err.Error())
		return
	}
	created := userService.Create(userDto)
	if created.Id <= 0 {
		fail(c, ErrAddFail)
	}
	resp(c, map[string]interface{}{
		"id": created.Id,
	})
}

// @Summary 编辑用户
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1}}"
// @Router /v1/api/users/:id [put]
//Create - c of crud
func (u UserController) Edit(c *gin.Context) {
	var userDto  dto.UserEditDto
	if err := dto.Bind(c, &userDto); err != nil {
		failValidate(c, err.Error())
		return
	}
	affected := userService.Update(userDto)
	if affected <= 0 {
		//todo : maybe more precision?
	}
	ok(c,"ok.UpdateDone")
}
