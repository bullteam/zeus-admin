package dto

// UserListSearchMapping - define search query keys in user list page
var MenuListSearchMapping = map[string]string{
	"d": "domain_id",
}

// MenuCreateDto - dto for menu's creation
type MenuCreateDto struct {
	Name     string `form:"name" binding:"required"`
	ParentId int    `form:"parent_id,default=0" binding:"gte=0"`
	DomainId int    `form:"domain_id" binding:"required,gte=1"`
	Url      string `form:"url"`
	Perms    string `form:"perms"`
	MenuType int    `form:"menu_type,default=1"`
	Icon     string `form:"icon"`
	OrderNum int    `form:"order_num,default=1"`
}

// MenuEditDto - dto for menu's modification
type MenuEditDto struct {
	Id       int    `uri:"id" binding:"required,gte=1"`
	Name     string `form:"name" binding:"required"`
	ParentId int    `form:"parent_id,default=0" binding:"gte=0"`
	DomainId int    `form:"domain_id" binding:"required,gte=1"`
	Url      string `form:"url"`
	Perms    string `form:"perms"`
	MenuType int    `form:"menu_type,default=0"`
	Icon     string `form:"icon"`
	OrderNum int    `form:"order_num,default=1"`
}
