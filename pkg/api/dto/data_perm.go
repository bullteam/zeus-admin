package dto

// DataPermListSearchMapping - define search query keys in data permission list page
var DataPermListSearchMapping = map[string]string{
	"d": "domain_id",
}

type DataPermAddDto struct {
	DomainId  int    `form:"domain_id" json:"domain_id" binding:"required"`   // 项目域id
	ParentId  int    `form:"parent_id" json:"parent_id"`                      // 父级id
	Name      string `form:"name" json:"name" binding:"required"`             // 名称
	Perms     string `form:"perms" json:"perms"`                              // 数据权限key
	PermsRule string `form:"perms_rule" json:"perms_rule"`                    // 数据权限规则
	PermsType int    `form:"perms_type" json:"perms_type" binding:"required"` // 类型 1=分类 2=数据权限
	OrderNum  int    `form:"order_num" json:"order_num" binding:"required"`   // 排序字段
	Remarks   string `form:"remarks" json:"remarks"`                          // 说明
}

type DataPermEditDto struct {
	Id        int    `uri:"id" json:"id" binding:"required"`
	DomainId  int    `form:"domain_id" json:"domain_id" binding:"required"`   // 项目域id
	ParentId  int    `form:"parent_id" json:"parent_id"`                      // 菜单ID
	Name      string `form:"name" json:"name" binding:"required"`             // 名称
	Perms     string `form:"perms" json:"perms" binding:"required"`           // 数据权限key
	PermsRule string `form:"perms_rule" json:"perms_rule" binding:"required"` // 数据权限规则
	PermsType int    `form:"perms_type" json:"perms_type" binding:"required"` // 类型 1=分类 2=数据权限
	OrderNum  int    `form:"order_num" json:"order_num" binding:"required"`   // 排序字段
	Remarks   string `form:"remarks" json:"remarks"`                          // 说明
}
