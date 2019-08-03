package model

type RoleDataPerm struct {
	Id         int `json:"id"`
	RoleId     int `json:"role_id"`
	DataPermId int `json:"data_perm_id"`
}

type GetByRoleIdData struct {
	Id     int    `json:"id"`
	RoleId int    `json:"role_id"`
	Name   string `json:"name"`
	Perms  string `json:"perms"`
}

func (r *RoleDataPerm) TableName() string {
	return "role_data_perm"
}
