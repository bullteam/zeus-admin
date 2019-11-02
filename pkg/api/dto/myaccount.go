package dto

type BindCodeDto struct {
	Google2faToken string `form:"google_2fa_token" valid:"Required"` // 验证码
}

type VerifyEmailDto struct {
	Email string `form:"email" json:"email" valid:"required"` // email
}

type EmailVerificationDto struct {
	Code string `form:"code" binding:"required"` // email
}
