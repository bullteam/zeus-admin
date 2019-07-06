package dao

import (
	"fmt"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/model"
)

type Role struct {
}

//Get - get single roel infoD
func (u Role) Get(id int) model.Role {
	var role model.Role
	db.Where("id = ?", id).Preload("Domain").First(&role)
	return role
}

// List - users list
func (u Role) List(listDto dto.GeneralListDto) ([]model.Role, int64) {
	var roles []model.Role
	var total int64
	db := GetDb()
	for sk, sv := range listDto.TransformSearch(dto.UserListSearchMapping) {
		db = db.Where(fmt.Sprintf("%s = ?", sk), sv)
	}
	db.Preload("Domain").Offset(listDto.Offset).Limit(listDto.Limit).Find(&roles)
	db.Model(&model.Role{}).Count(&total)
	return roles, total
}
