package model

const TableUserRole = "user_role"

type UserRole struct {
	Id   int
	User *User `orm:"rel(fk)"`
	Role *Role `orm:"rel(fk)"`
}

func (ur *UserRole) TableName() string {
	return TableUserRole
}
