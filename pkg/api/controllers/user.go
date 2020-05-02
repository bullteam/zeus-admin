package controllers

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"strconv"
	"strings"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/log"
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
// @Router /v1/users/{id} [get]
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
// @Router /v1/users?limit=20&offset=0 [get]
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
// @Summary 用户角色列表[分页+搜索]
// @Security ApiKeyAuth
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"result":[...],"total":1}}"
// @Router /v1/users/:id/roles [get]
func (u *UserController) Roles(c *gin.Context) {
	var listDto dto.GeneralGetDto
	if u.BindAndValidate(c, &listDto) {
		data := userService.GetAllRoles(strconv.Itoa(listDto.Id))
		resp(c, map[string]interface{}{
			"result": data,
			"total":  len(data),
		})
	}
}

// @Tags Users
// @Summary 新增用户
// @Security ApiKeyAuth
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1}}"
// @Router /v1/users?limit=20&offset=0 [get]
func (u *UserController) Create(c *gin.Context) {
	var userDto dto.UserCreateDto
	if u.BindAndValidate(c, &userDto) {
		user, err := userService.Create(userDto)
		if err != nil {
			fail(c, ErrInputData)
			return
		}
		// TODO insert ldap user
		resp(c, map[string]interface{}{
			"result": user,
		})
	}
}

// @Tags Users
// @Summary 编辑用户
// @Security ApiKeyAuth
// @Produce  json
// @Param id path int true "用户id"
// @Success 200 {string} json "{"code":200,"data":{"id":1}}"
// @Router /v1/users/{id} [put]
func (u *UserController) Edit(c *gin.Context) {
	var userDto dto.UserEditDto
	if u.BindAndValidate(c, &userDto) {
		log.Info(fmt.Sprintf("%#v", userDto))
		affected := userService.Update(userDto)
		// TODO update ldap user
		if affected > 0 {
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
// @Router /v1/users/{id}/status [put]
func (u *UserController) EditStatus(c *gin.Context) {
	var userDto dto.UserEditStatusDto
	if u.BindAndValidate(c, &userDto) {
		affected := userService.UpdateStatus(userDto)
		if affected > 0 {
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
// @Router /v1/users/{id}/password [put]
func (u *UserController) ResetPassword(c *gin.Context) {
	var userDto dto.GeneralGetDto
	if u.BindAndValidate(c, &userDto) {
		pwd := userService.ResetPassword(userDto)
		resp(c, map[string]interface{}{
			"newPwd": pwd,
		})
	}
}

// @Tags Users
// @Summary 删除用户
// @Security ApiKeyAuth
// @Param id path int true "用户id"
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1}}"
// @Router /v1/users/{id} [delete]
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
// @Summary 获取用户权限列表(带菜单)
// @Security ApiKeyAuth
// @Param id path int true "用户id"
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1}}"
// @Router /v1/users/{id}/permissions [get]
func (u *UserController) GetUserPermissionsWithMenu(c *gin.Context) {
	var userDto dto.GeneralGetDto
	if u.BindAndValidate(c, &userDto) {
		resp(c, map[string]interface{}{
			"result": userService.GetAllPermissions(c.GetString("id")),
		})
	}
}


// @Tags Users
// @Summary 获取用户权限列表
// @Security ApiKeyAuth
// @Param domain string ""
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1}}"
// @Router /v1/user/perm/list [get]
func (u *UserController) GetDomainPermissions(c *gin.Context) {
	var permDto dto.UserInDomainDto
	userId := int(c.Value("userId").(float64))
	if u.BindAndValidate(c, &permDto) {
		resp(c, map[string]interface{}{
			"result": userService.GetPermissionsOfDomain(strconv.Itoa(userId), permDto.Domain),
		})
	}
}

// @Tags Users
// @Summary 获取用户数据权限列表
// @Security ApiKeyAuth
// @Param domain string ""
// @Produce  json
// @Success 200 {string} json "{"code":200,"result":[["route","rules"]]}"
// @Router /v1/user/data-perm/list [get]
func (u *UserController) GetDomainDataPermissions(c *gin.Context) {
	var permDto dto.UserInDomainDto
	userId := int(c.Value("userId").(float64))
	if u.BindAndValidate(c, &permDto) {
		resp(c, map[string]interface{}{
			"result": userService.GetDataPermissionsOfDomain(strconv.Itoa(userId), permDto.Domain),
		})
	}
}

// @Tags Users
// @Summary 检查用户权限
// @Security ApiKeyAuth
// @Param id int true "用户id"
// @Param domain string ""
// @Param perm string ""
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"result":true}}"
// @Router /v1/user/perm/check [post]
func (u *UserController) DomainPermCheck(c *gin.Context) {
	var permDto dto.CheckPermDto
	userId := int(c.Value("userId").(float64))
	if u.BindAndValidate(c, &permDto) {
		resp(c, map[string]interface{}{
			"result": userService.CheckPermission(strconv.Itoa(userId), permDto.Domain, permDto.Perm),
		})
	}
}

// @Tags Users
// @Summary 获取用户特定域相关菜单
// @Security ApiKeyAuth
// @Param domain string ""
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1}}"
// @Router /v1/user/menu [get]
func (u *UserController) GetDomainMenus(c *gin.Context) {
	var permDto dto.UserInDomainDto
	userId := int(c.Value("userId").(float64))
	if u.BindAndValidate(c, &permDto) {
		resp(c, map[string]interface{}{
			"result": userService.GetDomainMenu(strconv.Itoa(userId), permDto.Domain),
		})
	}
}

// @Tags Users
// @Summary 移动部门
// @Security ApiKeyAuth
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1}}"
// @Router /v1/users/department/move [post]
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
