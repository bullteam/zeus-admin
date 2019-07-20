package dto

type BindCodeDto struct {
	Google2faToken string `form:"google_2fa_token" valid:"Required"` // 验证码
}

type VerifyEmail struct {
	Email string `form:"email" valid:"Required"` // email
}

type EmailVerificationDto struct {
	Code string `form:"code" valid:"Required"` // email
}
