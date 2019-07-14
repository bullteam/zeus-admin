package dto

import "time"

//DomainCreateDto - binding domain creation params
type DomainCreateDto struct {
	Id            int       `json:"id"`
	Name          string    `form:"name" json:"name" binding:"required"`
	Callbackurl   string    `form:"callbackurl" json:"callbackurl"`
	Remark        string       `form:"remark" json:"remark"`
	Code          string    `form:"code" json:"code"`
	CreateTime    time.Time `type(datetime)" json:"create_time"`
	LastLoginTime time.Time `type(datetime)" json:"-"`
}

//DomainEditDto - binding domain edition params
type DomainEditDto struct {
	Id          int    `uri:"id" json:"id" binding:"required"`
	Name        string `form:"name" json:"name" binding:"required"`
	Callbackurl string `form:"callbackurl" json:"callbackurl"`
	Remark      string    `form:"remark" json:"remark"`
	Code        string `form:"code" json:"code"`
}
