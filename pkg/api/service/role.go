package service

import (
	"github.com/pkg/errors"
	"zeus/pkg/api/dao"
	"zeus/pkg/api/domain/role"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/log"
	"zeus/pkg/api/model"
)

var roleDao = dao.Role{}
var menuDao = dao.Menu{}

// RoleService
type RoleService struct {
}

// InfoOfId - get role info by id
func (rs RoleService) InfoOfId(dto dto.GeneralGetDto) model.Role {
	return roleDao.Get(dto.Id)
}

// List - users list with pagination
func (rs RoleService) List(dto dto.GeneralListDto) ([]model.Role, int64) {
	return roleDao.List(dto)
}

// AssignPermission - assign permissions
func (rs RoleService) AssignPermission(roleId int, menuIds string) {
	roleData := roleDao.Get(roleId)
	menus := menuDao.GetMenusByIds(menuIds)
	if len(menus) > 0 {
		var policies [][]string
		for _, m := range menus {
			policies = append(policies, []string{roleData.RoleName, m.Perms, "*", roleData.Domain.Code})
		}
		role.OverwritePerm(roleData.RoleName, roleData.Domain.Code, policies)
	}
}

// Create - create a new account
func (rs RoleService) Create(dto dto.RoleCreateDto) (model.Role, error) {
	roleModel := model.Role{
		Name:     dto.Name,
		RoleName: dto.RoleName,
		Remark:   dto.Remark,
		DomainId: dto.DomainId,
	}
	c := roleDao.Create(&roleModel)
	if c == nil {
		return model.Role{}, errors.New("The role has exists")
	} else {
		if c.Error != nil {
			log.Error(c.Error.Error())
			return model.Role{}, c.Error
		}
		if dto.MenuIds != "" {
			rs.AssignPermission(roleModel.Id, dto.MenuIds)
		}
	}
	return roleModel, nil
}
