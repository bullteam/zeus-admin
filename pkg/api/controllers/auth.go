package controllers

import (
	jwt "github.com/appleboy/gin-jwt/v2"
	"github.com/gin-gonic/gin"
)

var jwtAuth *jwt.GinJWTMiddleware
var jwtAuths *jwt.GinJWTMiddleware

type AuthController struct {
	BaseController
}

// @Tags Users
// @Summary 用户登陆
// @Accept  json
// @Produce  json
// @Param username formData string true "登录名"
// @Param password formData string true "密码"
// @Param captchaid formData string false "验证码ID"
// @Param captchaval formData string false "验证码"
// @Success 200 {array} model.User "{"code":200,"data":{"id":1,"name":"wutong"}}"
// @Failure 400 {string} json "{"code":10004,"msg": "用户信息不存在"}"
// @Router /v1/users/login [post]
func (u *AuthController) JwtAuthLogin(c *gin.Context) {
	jwtAuth.LoginHandler(c)
}

// @Tags Users
// @Summary 用户refresh-token接口
// @Accept  json
// @Produce  json
// @Accept  multipart/form-data
// @Produce  json
// @Success 200 {array} model.User "{"code":200,"data":{"id":1,"name":"wutong"}}"
// @Failure 400 {string} json "{"code":10004,"msg": "用户信息不存在"}"
// @Router /v1/users/login/refresh [post]
func (u *AuthController) JwtAuthRefreshLogin(c *gin.Context) {
	jwtAuth.RefreshHandler(c)
}
