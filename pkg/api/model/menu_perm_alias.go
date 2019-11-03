package model

type MenuPermAlias struct {
	Id          int    `json:"id"`
	Perms       string `json:"perms"`
	Alias       string `json:"alias"`
	DomainId    int    `json:"domain_id"`
	CreatedTime int64  `json:"created_time"`
	UpdatedTime int64  `json:"updated_time"`
}

func (*MenuPermAlias) TableName() string {
	return "menu_perm_alias"
}
