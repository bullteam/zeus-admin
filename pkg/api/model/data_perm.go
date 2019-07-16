package model

const TableDataPerm = "data_perm"

type DataPerm struct {
	Id        int    `json:"id"`         // 自增ID
	ParentId  int    `json:"parent_id"`  // 父级id
	Name      string `json:"name"`       // 名称
	Perms     string `json:"perms"`      // 数据权限标识
	PermsRule string `json:"perms_rule"` // 数据规则
	PermsType int    `json:"perms_type"` // 类型 1=分类 2=数据权限
	OrderNum  int    `json:"order_num"`  // 排序字段
	DomainId  int    `json:"domain_id"`
	Remarks   string `json:"remarks"` // 说明
}

type DataPermQuery struct {
	DomainId   int
	Name       string
	Pagination *Pagination
}

func (dp *DataPerm) TableName() string {
	return TableDataPerm
}
