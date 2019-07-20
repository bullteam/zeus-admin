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

// RoleService
type RoleService struct {
}

// InfoOfId - get role info by id
func (rs RoleService) InfoOfId(dto dto.GeneralGetDto) model.Role {
	return roleDao.Get(dto.Id,true)
}

// List - users list with pagination
func (rs RoleService) List(dto dto.GeneralListDto) ([]model.Role, int64) {
	return roleDao.List(dto)
}

// AssignPermission - assign permissions
func (rs RoleService) AssignPermission(roleId int, menuIds string) {
	roleData := roleDao.Get(roleId,true)
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
		MenuIds : dto.MenuIds,
		MenuIdsEle: dto.MenuIdsEle,
	}
	c := roleDao.Create(&roleModel)
	if c == nil {
		return model.Role{}, errors.New("Duplicated role")
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

// Update - update role's information
func (rs RoleService) Update(dto dto.RoleEditDto) int64 {
	roleModel := roleDao.Get(dto.Id,false)
	if roleModel.Id < 1{
		return -1
	}
	roleModel.Name = dto.Name
	roleModel.Remark = dto.Remark
	roleModel.DomainId = dto.DomainId
	roleModel.MenuIds = dto.MenuIds
	roleModel.MenuIdsEle = dto.MenuIdsEle
	c := roleDao.Update(&roleModel)
	if c.RowsAffected > 0 {
		if dto.MenuIds != "" {
			rs.AssignPermission(roleModel.Id, dto.MenuIds)
		}
	}
	return c.RowsAffected
}

// Delete - delete role
func (rl RoleService) Delete(dto dto.GeneralDelDto) int64 {
	roleModel := roleDao.Get(dto.Id,false)
	if roleModel.Id < 1{
		return -1
	}
	//1. delete role
	c := roleDao.Delete(&roleModel)
	if c.RowsAffected > 0 {
		//2. delete role's policies
		role.DeletePerm(roleModel.RoleName)
	}
	return c.RowsAffected
}