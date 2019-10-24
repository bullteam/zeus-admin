package model

import "time"

//operation log mapping
type OperationLog struct {
	Id               int       `json:"id"`
	LogNo            string    `form:"log_no" json:"log_no" binding:"required"`
	Module           string    `form:"module" json:"module"`
	RequestUrl       string    `form:"request_url" json:"request_url"`
	OperationMethod  string    `form:"operation_method" json:"operation_method"`
	Params           string    `form:"params" json:"params"`
	ExceptionStack   string    `form:"exception_stack" json:"exception_stack"`
	OperationResult  string    `form:"operation_result" json:"operation_result"`
	OperationSuccess int       `form:"operation_success" json:"operation_success"`
	OperationTime    time.Time `gorm:"-" form:"operation_time" json:"operation_time"`
	UserId           int       `form:"user_id" json:"user_id"`
	Ip               string    `form:"ip" json:"ip"`
	IpLocation       string    `form:"ip_location" json:"ip_location"`
	OperationContent string    `form:"operation_content" json:"operation_content"`
	CreateTime       time.Time `json:"create_time" gorm:"column:create_time;not null;default:CURRENT_TIMESTAMP"`
	LastUpdateTime   time.Time `json:"updated_time" gorm:"column:last_update_time;not null;default:CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"`
}

func (log *OperationLog) TableName() string {
	return "operation_log"
}
