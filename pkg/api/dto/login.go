package dto

type LoginDto struct {
	Username string `form:"username" json:"username" binding:"required"`
	Password string `form:"password" json:"password" binding:"required"`
	Code     string `form:"code" json:"code"`
}

type TwoFaDto struct {
	Username string `form:"username" json:"username" binding:"required"`
}

// LoginOAuthDto - oauth login
type LoginOAuthDto struct {
	Code string `form:"code" binding:"required"`
	Type int    `form:"type" binding:"required"`
}

// BindThirdDto - bind third-part account
type BindThirdDto struct {
	From int    `form:"from"`
	Code string `form:"code" binding:"required"`
}

// UnBindThirdDto - unbind third-part account
type UnBindThirdDto struct {
	OAuthType int `form:"from"`
}
// LoginDingtalkDto - ding talk login
type LoginDingtalkDto struct {
	Code string `form:"code"`
}
