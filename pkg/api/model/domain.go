package model

import (
	"time"
)

type Domain struct {
	Id             int       `json:"id"`
	Name           string    `json:"name"`
	Callbackurl    string    `json:"callbackurl"`
	Remark         string    `json:"remark"`
	Code           string    `json:"code"`
	CreateTime     time.Time `json:"created_time"`
	LastUpdateTime time.Time `json:"updated_time"`
}

func (d *Domain) TableName() string {
	return "domain"
}
