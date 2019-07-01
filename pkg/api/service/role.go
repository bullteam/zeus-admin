package service

import (
	"zeus/pkg/api/dao"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/model"
)

var roleDao = dao.Role{}

// RoleService
type RoleService struct {

}

// InfoOfId - get role info by id
func (us RoleService) InfoOfId(dto dto.GeneralGetDto) model.Role {
	return roleDao.Get(dto.Id)
}

// List - users list with pagination
func (us RoleService) List(dto dto.GeneralListDto) ([]model.Role, int64) {
	return roleDao.List(dto)
}
