package dto

type LoginLogListDto struct {
	Username  string `form:"username"`
	Ip        string `form:"ip"`
	StartTime string `form:"start_time"`
	EndTime   string `form:"end_time"`
	Skip      int    `form:"skip,default=0" json:"skip"`
	Limit     int    `form:"limit,default=20" json:"limit" binding:"max=10000"`
	Order     string `form:"order" json:"order"`
}

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
