package controllers

import (
	"bytes"
	"encoding/base64"
	"fmt"
	"github.com/astaxie/beego/utils"
	"github.com/dgryski/dgoogauth"
	"github.com/gin-gonic/gin"
	"github.com/skip2/go-qrcode"
	"github.com/spf13/viper"
	"image/png"
	"net/url"
	"strconv"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/service"
	"zeus/pkg/api/utils/mailTemplate"
)

type AccountController struct {
	BaseController
}

// @Summary 登录用户信息
// @Tags account
// @Security ApiKeyAuth
// @Description 登陆用户信息接口
// @Accept  json
// @Produce  json
// @Param userId path int true "用户ID"
// @Success 200 {array} model.User "{"code":200,"data":{"id":1,"name":"wutong"}}"
// @Router /v1/account/info [get]
func (a AccountController) Info(c *gin.Context) {
	userId := int(c.Value("userId").(float64))
	data := userService.InfoOfId(dto.GeneralGetDto{Id: userId})
	resp(c, map[string]interface{}{
		"result": data,
	})
}

// @Tags Users
// @Summary 获取用户权限列表(带菜单)
// @Security ApiKeyAuth
// @Param id path int true "用户id"
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"id":1}}"
// @Router /v1/account/permissions [get]
func (a AccountController) GetPermissionsWithMenu(c *gin.Context) {
	userId := strconv.Itoa(int(c.Value("userId").(float64)))
	resp(c, map[string]interface{}{
		"result": userService.GetAllPermissions(userId),
		"info": map[string]interface{}{
			"id":       c.Value("userId"),
			"username": c.GetString("userName"),
		},
	})
}

// @Summary 更新个人密码
// @Tags account
// @Security ApiKeyAuth
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
	var accountDto dto.AccountEditPasswordDto
	var userDto dto.UserEditPasswordDto
	accountDto.Id = int(c.Value("userId").(float64))
	if a.BindAndValidate(c, &accountDto) {
		if accountDto.NewPassword != accountDto.RePassword {
			fail(c, ErrDifferentPasswords)
			return
		}
		userDto.Id = accountDto.Id
		userDto.Password = accountDto.RePassword
		affected := userService.UpdatePassword(userDto)
		if affected <= 0 {
			//fail(c,ErrEditFail)
			//return
		}
		ok(c, "ok.UpdateDone")
	}
}

// @Summary 获取用户管理域
// @Tags account
// @Security ApiKeyAuth
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
// @Tags account
// @Security ApiKeyAuth
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"result":[]}}"
// @Router /v1/account/domains [get]
// GetDomains - get user managing domains

// @Summary 获取个人中心用户信息
// @Tags account
// @Security ApiKeyAuth
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"result":[]}}"
// @Router /v1/account/accountinfo [get]
func (a *AccountController) AccountInfo(c *gin.Context) {
	userId := int(c.Value("userId").(float64))
	myAccountService := service.MyAccountService{}
	userSecretQuery, err := myAccountService.GetSecret(userId)
	if err != nil {
		fail(c, ErrInvalidUser)
		return
	}
	account := userSecretQuery.Account_name
	issuer := "宙斯"
	URL, err := url.Parse("otpauth://totp")
	if err != nil {
		fail(c, ErrInvalidParams)
		return
	}

	URL.Path += "/" + url.PathEscape(issuer) + ":" + url.PathEscape(account)
	params := url.Values{}
	params.Add("secret", userSecretQuery.Secret)
	params.Add("issuer", issuer)
	URL.RawQuery = params.Encode()
	p, errs := qrcode.New(URL.String(), qrcode.Medium)
	img := p.Image(256)
	if errs != nil {
		fail(c, ErrInvalidParams)
		return
	}
	out := new(bytes.Buffer)
	errx := png.Encode(out, img)
	if errx != nil {
		fail(c, ErrInvalidParams)
	}
	resp(c, map[string]interface{}{
		"result": dto.UserSecretRetDto{
			Is_open: userSecretQuery.Is_open,
			Account: account,
			Code:    "data:image/png;base64," + base64.StdEncoding.EncodeToString(out.Bytes()),
			Secret:  userSecretQuery.Secret,
		},
	})
}

// @Summary 绑定2fa goole 验证码
// @Tags account
// @Security ApiKeyAuth
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"result":[]}}"
// @Router /v1/account/bindcode [get]
func (a *AccountController) BindGoogle2faCode(c *gin.Context) {
	userId := int(c.Value("userId").(float64))
	myAccountService := service.MyAccountService{}
	userSecretQuery, err := myAccountService.GetSecret(userId)
	if err != nil {
		fail(c, ErrInvalidUser)
		return
	}
	secretBase32 := userSecretQuery.Secret
	bindCodeDto := &dto.BindCodeDto{}
	if !a.BindAndValidate(c, &bindCodeDto) {
		fail(c, ErrInvalidParams)
		return
	}
	otpc := &dgoogauth.OTPConfig{
		Secret:      secretBase32,
		WindowSize:  3,
		HotpCounter: 0,
		// UTC:         true,
	}
	val, err := otpc.Authenticate(bindCodeDto.Google2faToken)
	if err != nil {
		fail(c, ErrGoogleBindCode)
		return
	}
	if !val {
		fail(c, ErrGoogleBindCode)
		return
	}

	myAccountService.Update2FaStatus(userId, 1) //更新状态
	resp(c, map[string]interface{}{
		"result": "bind success!",
	})
}

// @Summary 关闭Google 两步验证
// @Tags account
// @Security ApiKeyAuth
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"result":[]}}"
// @Router /v1/account/close2fa [post]
func (a *AccountController) Close2fa(c *gin.Context) {
	userId := int(c.Value("userId").(float64))
	myAccountService := service.MyAccountService{}
	userSecretQuery, err := myAccountService.GetSecret(userId)
	if err != nil {
		fail(c, ErrInvalidUser)
		return
	}
	secretBase32 := userSecretQuery.Secret
	bindCodeDto := &dto.BindCodeDto{}
	if !a.BindAndValidate(c, &bindCodeDto) {
		fail(c, ErrInvalidParams)
		return
	}
	otpc := &dgoogauth.OTPConfig{
		Secret:      secretBase32,
		WindowSize:  3,
		HotpCounter: 0,
		// UTC:         true,
	}
	val, err := otpc.Authenticate(bindCodeDto.Google2faToken)
	if err != nil {
		fail(c, ErrGoogleBindCode)
		return
	}
	if !val {
		fail(c, ErrGoogleBindCode)
		return
	}

	myAccountService.Update2FaStatus(userId, 0) //更新状态
	resp(c, map[string]interface{}{
		"result": "update success!",
	})
}

// @Summary 验证2fa goole 验证码
// @Tags account
// @Security ApiKeyAuth
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"result":[]}}"
// @Router /v1/account/check-google-2fa-code [get]
func (a *AccountController) CheckGoogle2faCode(c *gin.Context) {
	userId := int(c.Value("userId").(float64))
	myAccountService := service.MyAccountService{}
	userSecretQuery, err := myAccountService.GetSecret(userId)
	if err != nil {
		fail(c, ErrInvalidUser)
		return
	}
	secretBase32 := userSecretQuery.Secret
	bindCodeDto := &dto.BindCodeDto{}
	if !a.BindAndValidate(c, &bindCodeDto) {
		fail(c, ErrInvalidParams)
		return
	}
	otpc := &dgoogauth.OTPConfig{
		Secret:      secretBase32,
		WindowSize:  3,
		HotpCounter: 0,
	}
	val, err := otpc.Authenticate(bindCodeDto.Google2faToken)
	if err != nil {
		fail(c, ErrGoogleBindCode)
		return
	}
	if !val {
		fail(c, ErrGoogleBindCode)
		return
	}
	resp(c, map[string]interface{}{
		"result": "Authenticated!",
	})
}

// @Summary 判断是否开启 Google 两步验证
// @Tags account
// @Security ApiKeyAuth
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"result":[]}}"
// @Router /v1/account/close2fa [post]
func (a *AccountController) FindCodeOpen(c *gin.Context) {
	userId := int(c.Value("userId").(float64))
	myAccountService := service.MyAccountService{}
	userSecretQuery, err := myAccountService.GetSecret(userId)
	if err != nil {
		fail(c, ErrInvalidUser)
		return
	}
	resp(c, map[string]interface{}{
		"is_open": userSecretQuery.Is_open,
	})
}

// @Summary 第三方绑定列表
// @Tags account
// @Security ApiKeyAuth
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"result":[]}}"
// @Router /v1/account/third [get]
func (a *AccountController) ThirdList(c *gin.Context) {
	var listDto dto.GeneralListDto
	//userId := int(c.Value("userId").(float64))
	if a.BindAndValidate(c, &listDto) {
		myAccountService := service.MyAccountService{}
		data, total := myAccountService.GetThirdList(listDto)
		resp(c, map[string]interface{}{
			"result": data,
			"total":  total,
		})
	}
}

// @Summary 验证邮件地址(发送邮件)
// @Tags account
// @Security ApiKeyAuth
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"result":[]}}"
// @Router /v1/account/third [get]
func (a *AccountController) Verifymail(c *gin.Context) {
	verifyEmailDto := &dto.VerifyEmailDto{}
	if a.BindAndValidate(c, &verifyEmailDto) {
		username := viper.GetString("email.username")
		password := viper.GetString("email.password")
		host := viper.GetString("email.host")
		port := viper.GetInt("email.port")
		from := viper.GetString("email.from")
		if port == 0 {
			port = 25
		}
		config := fmt.Sprintf(`{"username":"%s","password":"%s","host":"%s","port":%d,"from":"%s"}`, username, password, host, port, from)
		temail := utils.NewEMail(config)
		temail.To = []string{verifyEmailDto.Email} //指定收件人邮箱地址
		temail.From = from                         //指定发件人的邮箱地址
		temail.Subject = "验证账号邮件"                  //指定邮件的标题
		temail.HTML = mailTemplate.MailBody()
		err := temail.Send()
		if err != nil {
			fail(c, ErrSendMail)
			return
		}
		resp(c, map[string]interface{}{
			"result": "email send success！",
		})
	}

}

// @Summary 验证邮件地址(验证)
// @Tags account
// @Security ApiKeyAuth
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"result":[]}}"
// @Router /v1/account/emailverification [get]
func (a *AccountController) EmailVerify(c *gin.Context) {
	emailVerificationDto := &dto.EmailVerificationDto{}
	if a.BindAndValidate(c, &emailVerificationDto) {
		resp(c, map[string]interface{}{
			"result": "email verify success！",
		})
	}
}

// @Summary 解除绑定第三方应用
// @Tags account
// @Security ApiKeyAuth
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"result":[]}}"
// @Router /v1/account/thirdbind [get]
func (a *AccountController) Thirdbind(c *gin.Context) {
	bindThirdDto := &dto.BindThirdDto{}
	if a.BindAndValidate(c, &bindThirdDto) {
		from := bindThirdDto.From
		if from == 0 {
			from = 1
		}
		userId := int(c.Value("userId").(float64))
		myAccountService := service.MyAccountService{} //switch case from  1 钉钉 2 微信 TODO
		openid, err := myAccountService.BindDingtalk(bindThirdDto.Code, userId, from)
		if err != nil {
			fail(c, ErrBindDingtalk)
			return
		}
		data := map[string]string{
			"openid": openid,
		}
		resp(c, map[string]interface{}{
			"result": data,
		})
	}
}

// @Summary 解除绑定第三方应用
// @Tags account
// @Security ApiKeyAuth
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":{"result":[]}}"
// @Router /v1/account/thirdunbind [get]
func (a *AccountController) ThirdUnbind(c *gin.Context) {
	UnBindDingtalkDto := &dto.UnBindThirdDto{}
	if a.BindAndValidate(c, &UnBindDingtalkDto) {
		userId := int(c.Value("userId").(float64))
		oauthType := UnBindDingtalkDto.OAuthType
		if oauthType == 0 {
			oauthType = 1
		}
		userService := service.UserService{} //switch case from  1 钉钉 2 微信 TODO
		errs := userService.UnBindUserDingtalk(oauthType, userId)
		if errs != nil {
			fail(c, ErrUnBindDingtalk)
		}
		data := map[string]bool{
			"state": true,
		}
		resp(c, map[string]interface{}{
			"result": data,
		})
	}

}

func (a *AccountController) LdapAddUser(c *gin.Context) {

}
