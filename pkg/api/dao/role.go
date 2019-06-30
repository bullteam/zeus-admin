package dao

import "zeus/pkg/api/model"

type Role struct {

}

//Get - get single roel infoD
func (u Role) Get(id int) model.Role {
	var role model.Role
	db.Where("id = ?", id).Preload("Domain").First(&role)
	return role
}