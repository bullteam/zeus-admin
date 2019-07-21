package controllers

import (
	"github.com/beego/i18n"
	"github.com/gin-gonic/gin"
	"net/http"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/middleware"
)

type ControllerError struct {
	Code     int    `json:"code"`
	Langkey  string `json:"langkey"`
	Message  string `json:"msg"`
	Moreinfo string `json:"moreinfo"`
}

var (
	Err404               = &ControllerError{404, "err.Err404", "", ""}
	ErrInputData         = &ControllerError{10001, "err.ErrInputData", "", ""}
	ErrDatabase          = &ControllerError{10002, "err.ErrDatabase", "", ""}
	ErrDupUser           = &ControllerError{10003, "err.ErrDupUser", "", ""}
	ErrNoUser            = &ControllerError{10004, "err.ErrNoUser", "", ""}
	ErrPass              = &ControllerError{10005, "err.ErrPass", "", ""}
	ErrNoUserPass        = &ControllerError{10006, "err.ErrNoUserPass", "", ""}
	ErrNoUserChange      = &ControllerError{10007, "err.ErrNoUserChange", "", ""}
	ErrInvalidUser       = &ControllerError{10008, "err.ErrInvalidUser", "", ""}
	ErrOpenFile          = &ControllerError{10009, "err.ErrOpenFile", "", ""}
	ErrWriteFile         = &ControllerError{10010, "err.ErrWriteFile", "", ""}
	ErrSystem            = &ControllerError{10011, "err.ErrSystem", "", ""}
	ErrExpired           = &ControllerError{10012, "err.ErrExpired", "", ""}
	ErrPermission        = &ControllerError{10013, "err.ErrPermission", "", ""}
	Actionsuccess        = &ControllerError{90000, "ok.Actionsuccess", "", ""}
	ErrGenJwt            = &ControllerError{10014, "err.ErrGenJwt", "", ""}
	ErrChkJwt            = &ControllerError{10012, "err.ErrChkJwt", "", ""}
	ErrIdData            = &ControllerError{10016, "err.ErrIdData", "", ""}
	ErrAddFail           = &ControllerError{11000, "err.ErrAddFail", "", ""}
	ErrEditFail          = &ControllerError{11001, "err.ErrEditFail", "", ""}
	ErrDelFail           = &ControllerError{11002, "err.ErrDelFail", "", ""}
	ErrInvalidParams     = &ControllerError{11003, "err.ErrInvalidParams", "", ""}
	ErrRoleAssignFail    = &ControllerError{12000, "err.ErrRoleAssignFail", "", ""}
	ErrMenuData          = &ControllerError{12001, "err.ErrMenuData", "", ""}
	ErrCaptchaEmpty      = &ControllerError{13001, "err.ErrCaptchaEmpty", "", ""}
	ErrCaptcha           = &ControllerError{13002, "err.ErrCaptcha", "", ""}
	ErrDeptDel           = &ControllerError{13003, "err.ErrDeptDel", "", "部门内仍有成员,请先行转移到其它部门"}
	ErrDeptHasMember     = &ControllerError{13004, "err.ErrDeptHasMember", "", "部门内仍有成员"}
	ErrDupRecord         = &ControllerError{13005, "err.ErrDupRecord", "", ""}
	ErrWrongRefreshToken = &ControllerError{13006, "err.ErrWrongRefreshToken", "", ""}
	ErrBindDingtalk      = &ControllerError{13007, "err.ErrBindDingtalk", "", ""}
	ErrUnBindDingtalk    = &ControllerError{13008, "err.ErrUnBindDingtalk", "", ""}
	ErrGoogleBindCode    = &ControllerError{13009, "err.ErrGoogleBindCode", "", ""}
	ErrSendMail          = &ControllerError{13010, "err.ErrSendMail", "", ""}
	ErrValidation        = &ControllerError{13011, "err.ErrValidate", "", ""}
	ErrNoRecord          = &ControllerError{13012, "err.ErrNoRecord", "", ""}
	ErrHasSubRecord      = &ControllerError{13013, "err.ErrHasSubRecord", "", ""}
)

type BaseController struct {
}

func (bc *BaseController) BindAndValidate(c *gin.Context, obj interface{}) bool {
	if err := dto.Bind(c, obj); err != nil {
		failValidate(c, err.Error())
		return false
	}
	return true
}

func resp(c *gin.Context, data map[string]interface{}) {
	c.JSON(http.StatusOK, gin.H{
		"code": 200,
		"data": data,
	})
}
func ok(c *gin.Context, langKey string) {
	c.JSON(http.StatusOK, gin.H{
		"code": 200,
		"msg":  i18n.Tr(middleware.GetLang(), langKey),
	})
}
func fail(c *gin.Context, errs *ControllerError) {
	//currentLang,_ := c.Cookie("lang")
	//currentLang := GetLang
	errs.Message = i18n.Tr(middleware.GetLang(), errs.Langkey)
	c.JSON(http.StatusOK, gin.H{
		"code":     errs.Code,
		"msg":      errs.Message,
		"moreinfo": errs.Moreinfo,
	})
}

func failValidate(c *gin.Context, msg string) {
	errs := ErrValidation
	errs.Message = i18n.Tr(middleware.GetLang(), errs.Langkey)
	c.AbortWithStatusJSON(http.StatusOK, gin.H{
		"code":   errs.Code,
		"msg":    errs.Message,
		"detail": msg,
	})
	//c.JSON(http.StatusOK, gin.H{
	//	"code":   errs.Code,
	//	"msg":    errs.Message,
	//	"detail": msg,
	//})
}
