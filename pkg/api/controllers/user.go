package controllers

import (
	"github.com/gin-gonic/gin"
	"strings"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/service"
)

var userService = service.UserService{}

type UserController struct {
	BaseController
}

// @Tags Users
// @Summary 用户信息
// @Security ApiKeyAuth
// @Accept  json
// @Produce  json
// @Param id path int true "用户id"
// @Success 200 {array} model.User "{"code":200,"data":{"id":1,"name":"wutong"}}"
// @Failure 400 {string} json "{"code":10004,"msg": "用户信息不存在"}"
// @Router /users/{id} [get]
func (u *UserController) Get(c *gin.Context) {
	var gDto dto.GeneralGetDto
	if u.BindAndValidate(c, &gDto) {
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
}

// @Tags Users
// @Summary 用户列表[分页+搜索]
// @Security ApiKeyAuth
// @Param limit query int false "条数"
// @Param skip query int false "偏移量"
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"result":[...],"total":1}}"
// @Router /users?limit=20&offset=0 [get]
func (u *UserController) List(c *gin.Context) {
	var listDto dto.GeneralListDto
	if u.BindAndValidate(c, &listDto) {
		data, total := userService.List(listDto)
		resp(c, map[string]interface{}{
			"result": data,
			"total":  total,
		})
	}
}

// @Tags Users
// @Summary 新增用户
// @Security ApiKeyAuth
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1}}"
// @Router /v1/api/users?limit=20&offset=0 [get]
func (u *UserController) Create(c *gin.Context) {
	var userDto dto.UserCreateDto
	if u.BindAndValidate(c, &userDto) {
		created := userService.Create(userDto)
		if created.Id <= 0 {
			fail(c, ErrAddFail)
		}
		resp(c, map[string]interface{}{
			"id": created.Id,
		})
	}
}

// @Tags Users
// @Summary 编辑用户
// @Security ApiKeyAuth
// @Produce  json
// @Param id path int true "用户id"
// @Success 200 {string} json "{"code":200,"data":{"id":1}}"
// @Router /users/{id} [put]
func (u *UserController) Edit(c *gin.Context) {
	var userDto dto.UserEditDto
	if u.BindAndValidate(c, &userDto) {
		affected := userService.Update(userDto)
		if affected <= 0 {
			//fail(c,ErrEditFail)
			//return
		}
		ok(c, "ok.UpdateDone")
	}
}

// @Tags Users
// @Summary 更新用户状态
// @Security ApiKeyAuth
// @Param id path int true "用户id"
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1}}"
// @Router /users/{id}/status [put]
func (u *UserController) EditStatus(c *gin.Context) {
	var userDto dto.UserEditStatusDto
	if u.BindAndValidate(c, &userDto) {
		affected := userService.UpdateStatus(userDto)
		if affected <= 0 {
			//fail(c,ErrEditFail)
			//return
		}
		ok(c, "ok.UpdateDone")
	}
}

// @Tags Users
// @Summary 更新用户密码
// @Security ApiKeyAuth
// @Param id path int true "用户id"
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1}}"
// @Router /users/{id}/password [put]
func (u *UserController) EditPassword(c *gin.Context) {
	var userDto dto.UserEditPasswordDto
	if u.BindAndValidate(c, &userDto) {
		affected := userService.UpdatePassword(userDto)
		if affected <= 0 {
			//fail(c,ErrEditFail)
			//return
		}
		ok(c, "ok.UpdateDone")
	}
}

// @Tags Users
// @Summary 删除用户
// @Security ApiKeyAuth
// @Param id path int true "用户id"
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1}}"
// @Router /users/{id} [delete]
func (u *UserController) Delete(c *gin.Context) {
	var userDto dto.GeneralDelDto
	if u.BindAndValidate(c, &userDto) {
		affected := userService.Delete(userDto)
		if affected <= 0 {
			fail(c, ErrDelFail)
			return
		}
		ok(c, "ok.DeletedDone")
	}
}

// @Tags Users
// @Summary 获取用户权限列表
// @Security ApiKeyAuth
// @Param id path int true "用户id"
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1}}"
// @Router /users/{id}/permissions [get]
func (u *UserController) GetUserPermissions(c *gin.Context) {
	var userDto dto.GeneralGetDto
	if u.BindAndValidate(c, &userDto) {
		resp(c, map[string]interface{}{
			"result": userService.GetAllPermissions(c.GetString("userId")),
		})
	}
}

// @Tags Users
// @Summary 移动部门
// @Security ApiKeyAuth
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1}}"
// @Router /users/department/move [post]
func (u *UserController) UpdateDepartment(c *gin.Context) {
	var userDto dto.UserMoveDepartmentDto
	if u.BindAndValidate(c, &userDto) {
		err := userService.MoveToAnotherDepartment(strings.Split(userDto.Ids, ","), userDto.Department)
		if err != nil {
			errInfo := ErrEditFail
			errInfo.Moreinfo = err.Error()
			fail(c, errInfo)
			return
		}
		ok(c, "ok.UpdateDone")
	}
}
