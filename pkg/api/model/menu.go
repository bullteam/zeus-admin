package model

import (
	"time"
)

type Menu struct {
	Id             int       `json:"id"`
	ParentId       int       `json:"parent_id"`
	DomainId       int       `json:"domain_id"`
	Domain         Domain    `json:"domain"`
	Name           string    `json:"name"`
	Url            string    `json:"url"`
	Perms          string    `json:"perms"`
	MenuType       int       `json:"menu_type"`
	Icon           string    `json:"icon"`
	OrderNum       int       `json:"order_num"`
	CreateTime     time.Time `gorm:"type:time;column:create_time;not null;default:CURRENT_TIMESTAMP" json:"created_time,omitempty" example:"2019-07-10 0:39"`
	LastUpdateTime time.Time `gorm:"type:time;column:last_update_time;not null;default:CURRENT_TIMESTAMP ON UPDATE" json:"last_update_time,omitempty" example:"2019-07-10 0:39"`
}

func (m *Menu) TableName() string {
	return "menu"
}
