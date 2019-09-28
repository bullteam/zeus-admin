package model

import (
	"time"
)

//login log mapping
type LoginLog struct {
	Id               int       `json:"id"`
	UserId           string    `form:"user_id" json:"user_id" binding:"required"`
	Client           string    `form:"client" json:"client"`
	Platform         string    `form:"platform" json:"platform"`
	LoginResult      string    `form:"login_result" json:"login_result"`
	LoginStatus      int       `form:"login_status" json:"login_status"`
	LoginTime        time.Time `form:"type(datetime)" json:"login_time"`
	Ip               string    `form:"ip" json:"ip"`
	IpLocation       string    `json:"ip_location"`
	OperationTime    string    `form:"operation_time" json:"operation_time"`
	OperationContent string    `form:"operation_content" json:"operation_content"`
	CreateTime       time.Time `form:"type(datetime)" json:"-"`
	LastUpdateTime   time.Time `form:"type(datetime)" json:"-"`
}

func (log *LoginLog) TableName() string {
	return "login_log"
}
