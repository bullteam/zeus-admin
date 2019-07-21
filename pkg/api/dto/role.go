package dto

// RoleListSearchMapping - define search query keys in role list page
var RoleListSearchMapping = map[string]string{
	"n": "name",
	"d": "domain_id",
	"r": "role_name",
}

// RoleCreateDto - dto for role's creation
type RoleCreateDto struct {
	Name       string `form:"name" binding:"required"`
	DomainId   int    `form:"domain_id" binding:"required,gte=1"`
	RoleName   string `form:"role_name" binding:"required"`
	Remark     string `form:"remark"`
	MenuIds    string `form:"menu_ids"`
	MenuIdsEle string `form:"menu_ids_ele"`
}

// RoleEditDto - dto for role's modification
type RoleEditDto struct {
	Id         int    `uri:"id" binding:"required,gte=1"`
	Name       string `form:"name" binding:"required"`
	DomainId   int    `form:"domain_id" binding:"required,gte=1"`
	Remark     string `form:"remark"`
	MenuIds    string `form:"menu_ids"`
	MenuIdsEle string `form:"menu_ids_ele"`
}
