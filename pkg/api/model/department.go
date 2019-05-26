package model

import "github.com/jinzhu/gorm"

type Department struct {
	gorm.Model
	Id       int    `json:"id"`
	Name     string `json:"name"`
	OrderNum int    `json:"order_num"`
	ParentId int    `json:"parent_id"`
}