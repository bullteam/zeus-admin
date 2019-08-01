package model

import (
	"time"
)

const TableMenu = "menu"

type Menu struct {
	Id             int       `json:"id"`
	ParentId       int       `json:"parent_id"`
	DomainId       int       `json:"domain_id"`
	Domain         Domain    `json:"domain"`
	Name           string    `json:"name"`
	Url            string    `json:"url"`
	Perms          string    `json:"url"`
	MenuType       int       `json:"menu_type"`
	Icon           string    `json:"icon"`
	OrderNum       int       `json:"order_num"`
	CreateTime     time.Time `json:"create_time"`
	LastUpdateTime time.Time `json:"last_update_time"`
}

func (m *Menu) TableName() string {
	return TableMenu
}
