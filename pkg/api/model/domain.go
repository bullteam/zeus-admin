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
	CreateTime     time.Time `json:"create_time" gorm:"column:create_time;not null;default:CURRENT_TIMESTAMP"`
	LastUpdateTime time.Time `json:"updated_time" gorm:"column:last_update_time;not null;default:CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"`
}

func (d *Domain) TableName() string {
	return "domain"
}
