package dto

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
