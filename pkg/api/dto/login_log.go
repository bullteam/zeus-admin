package dto

type LoginLogDto struct {
	UserId           int    `form:"user_id" binding:"required"`
	Client           string `form:"client"`
	Platform         string `form:"form"`
	Ip               string `form:"ip"`
	IpLocation       string `form:"ip_location"`
	LoginResult      string `form:"login_result"`
	LoginStatus      int    `form:"login_status"`
	OperationContent string `form:"operation_content"`
}
