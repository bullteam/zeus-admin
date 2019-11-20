package dto

type OperationLogListDto struct {
	Username  string `form:"username"`
	Ip        string `form:"ip"`
	StartTime string `form:"start_time"`
	EndTime   string `form:"end_time"`
	Skip      int    `form:"skip,default=0" json:"skip"`
	Limit     int    `form:"limit,default=20" json:"limit" binding:"max=10000"`
	Order     string `form:"order" json:"order"`
}

type OperationLogDto struct {
	RequestUrl       string `form:"request_url"`
	OperationMethod  string `form:"operation_method"`
	Params           string `form:"params"`
	UserId           int    `form:"user_id" valid:"Required"`
	Ip               string `form:"ip"`
	IpLocation       string `form:"ip_location"`
	OperationResult  string `form:"operation_result"`
	OperationSuccess int    `form:"operation_success"`
	OperationContent string `form:"operation_content"`
}
