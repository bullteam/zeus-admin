package service

import (
	"zeus/pkg/api/dao"
	"zeus/pkg/api/domain/role"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/model"
)

var roleDao = dao.Role{}
var menuDao = dao.Menu{}

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

// AssignPermission - assign permissions
func (us RoleService) AssignPermission(roleId int, menuIds string) {
	roleData := roleDao.Get(roleId)
	menus := menuDao.GetMenusByIds(menuIds)
	if len(menus) > 0 {
		var policies [][]string
		for _, m := range menus {
			policies = append(policies, []string{"p", m.Perms, "*", roleData.Domain.Code})
		}
		role.OverwritePerm(roleData.RoleName, roleData.Domain.Code, policies)
	}
}
