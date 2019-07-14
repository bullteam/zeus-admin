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
// @Accept  json
// @Produce  json
// @Success 200 {array} model.User "{"code":200,"data":{"id":1,"name":"wutong"}}"
// @Failure 400 {string} json "{"code":10004,"msg": "用户信息不存在"}"
// @Router /v1/api/users/:id [get]
func (u UserController) Get(c *gin.Context) {
	var gDto dto.GeneralGetDto
	if err := dto.Bind(c, &gDto); err != nil {
		failValidate(c, err.Error())
		return
	}
	data := userService.InfoOfId(gDto)
	//user not found
	if data.Id < 1 {
		fail(c, ErrNoUser)
		return
	}
	resp(c, map[string]interface{}{
		"result": data,
	})
}

// @Summary 用户列表[分页+搜索]
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"result":[...],"total":1}}"
// @Router /v1/api/users?limit=20&offset=0 [get]
// List - r of crud
func (u UserController) List(c *gin.Context) {
	var listDto dto.GeneralListDto
	_ = dto.Bind(c, &listDto)
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
// Edit - u of crud
func (u UserController) Edit(c *gin.Context) {
	var userDto dto.UserEditDto
	if err := dto.Bind(c, &userDto); err != nil {
		failValidate(c, err.Error())
		return
	}
	affected := userService.Update(userDto)
	if affected <= 0 {
		//fail(c,ErrEditFail)
		//return
	}
	ok(c, "ok.UpdateDone")
}

// @Summary 更新用户状态
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1}}"
// @Router /v1/api/users/:id/status [put]
// Edit - u of crud
func (u UserController) EditStatus(c *gin.Context) {
	var userDto dto.UserEditStatusDto
	if err := dto.Bind(c, &userDto); err != nil {
		failValidate(c, err.Error())
		return
	}
	affected := userService.UpdateStatus(userDto)
	if affected <= 0 {
		//fail(c,ErrEditFail)
		//return
	}
	ok(c, "ok.UpdateDone")
}

// @Summary 更新用户密码
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1}}"
// @Router /v1/api/users/:id/password [put]
// Edit - u of crud
func (u UserController) EditPassword(c *gin.Context) {
	var userDto dto.UserEditPasswordDto
	if err := dto.Bind(c, &userDto); err != nil {
		failValidate(c, err.Error())
		return
	}
	affected := userService.UpdatePassword(userDto)
	if affected <= 0 {
		//fail(c,ErrEditFail)
		//return
	}
	ok(c, "ok.UpdateDone")
}

// @Summary 删除用户
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1}}"
// @Router /v1/api/users/:id [delete]
//Create - d of crud
func (u UserController) Delete(c *gin.Context) {
	var userDto dto.GeneralDelDto
	if err := dto.Bind(c, &userDto); err != nil {
		failValidate(c, err.Error())
		return
	}
	affected := userService.Delete(userDto)
	if affected <= 0 {
		fail(c, ErrDelFail)
		return
	}
	ok(c, "ok.DeletedDone")
}
