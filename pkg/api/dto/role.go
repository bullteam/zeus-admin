package dto

type RoleCreateDto struct {
	Name       string `form:"name" binding:"required"`
	DomainId   int    `form:"domain_id" binding:"required"`
	RoleName   string `form:"role_name" binding:"required"`
	Remark     string `form:"remark"`
	MenuIds    string `form:"menu_ids"`
	MenuIdsEle string `form:"menu_ids_ele"`
}
