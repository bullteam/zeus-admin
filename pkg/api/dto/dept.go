package dto

import "time"

//DeptCreateDto - binding domain creation params
type DeptCreateDto struct {
	Id         int       `json:"id"`
	Name       string    `form:"name" json:"name" binding:"required"`
	ParentId   int       `form:"parent_id" json:"parent_id" binding:"required"`
	OrderNum   int       `form:"order_num" json:"order_num"`
	CreateTime time.Time `type(datetime)" json:"create_time"`
	UpdateTime time.Time `type(datetime)" json:"-"`
}

//DeptEditDto - binding domain edition params
type DeptEditDto struct {
	Id       int    `uri:"id" json:"id" binding:"required"`
	Name     string `form:"name" json:"name" binding:"required"`
	ParentId int    `form:"parent_id" json:"parent_id" binding:"required"`
	OrderNum int    `form:"order_num" json:"order_num"`
}
