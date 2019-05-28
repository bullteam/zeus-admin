package model

const TableRoleDataPerm = "role_data_perm"

type RoleDataPerm struct {
	Id         int `json:"id"`
	RoleId     int `json:"role_id"`
	DataPermId int `json:"data_perm_id"`
}

func (r *RoleDataPerm) TableName() string {
	return TableRoleDataPerm
}
