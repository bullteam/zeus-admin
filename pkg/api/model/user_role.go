package model

const TableUserRole = "user_role"

type UserRole struct {
	Id   int
	UserId int `sql:"index"`
	RoleId int `sql:"index"`
}

func (UserRole) TableName() string {
	return TableUserRole
}
