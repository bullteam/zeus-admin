package controllers

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"strconv"
	"zeus/pkg/api/dto"
)

type AccountController struct {
	BaseController
}

// @Summary 登录用户信息
// @Description 登陆用户信息接口
// @Accept  json
// @Produce  json
// @Param userId path int true "用户ID"
// @Success 200 {array} model.User "{"code":200,"data":{"id":1,"name":"wutong"}}"
// @Router /v1/account/info [get]
func (u AccountController) Info(c *gin.Context) {
	userId := int(c.Value("userId").(float64))
	data := userService.InfoOfId(dto.GeneralGetDto{Id: userId})
	resp(c, map[string]interface{}{
		"result": data,
	})
}

// @Summary 更新个人密码
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1}}"
// @Router /v1/account/password [put]
// EditPassword - update login user's password
func (a *AccountController) EditPassword(c *gin.Context) {
	// simulate value in query
	c.Params = []gin.Param{
		{
			Key:   "id",
			Value: fmt.Sprintf("%d", int(c.Value("userId").(float64))),
		},
	}
	var userDto dto.UserEditPasswordDto
	if a.BindAndValidate(c, &userDto) {
		affected := userService.UpdatePassword(userDto)
		if affected <= 0 {
			//fail(c,ErrEditFail)
			//return
		}
		ok(c, "ok.UpdateDone")
	}
}

// @Summary 获取用户管理域
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"result":[]}}"
// @Router /v1/account/domains [get]
// GetDomains - get user managing domains
func (AccountController) GetDomains(c *gin.Context) {
	userId := int(c.Value("userId").(float64))
	domains := userService.GetRelatedDomains(strconv.Itoa(userId))
	resp(c, map[string]interface{}{
		"result": domains,
	})
}

// @Summary 获取登录用户权限列表
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"result":[]}}"
// @Router /v1/account/domains [get]
// GetDomains - get user managing domains
