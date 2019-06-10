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
// @Success 200 {string} json "{"code":0,"data":{"id":1,"name":"test"}}"
// @Router /v1/api/info [get]
func (u UserController) Info(c *gin.Context) {
	resp(c, gin.H{
		"id":   c.Value("userId"),
		"name": c.Value("userName"),
	})
}

//List - r of crud
func (u UserController) List(c *gin.Context) {
	var listDto dto.GeneralListDto
	dto.Bind(c, &listDto)
	data, total := userService.List(listDto)
	resp(c, map[string]interface{}{
		"result": data,
		"total":  total,
	})
}

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
