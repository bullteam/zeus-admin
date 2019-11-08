package service

import (
	"github.com/pkg/errors"
	"strconv"
	"strings"
	"zeus/pkg/api/dao"
	"zeus/pkg/api/domain/role"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/log"
	"zeus/pkg/api/model"
)

var roleDao = dao.Role{}
var roleDataPermDao = dao.RoleDataPermDao{}

// RoleService
type RoleService struct {
}

// InfoOfId - get role info by id
func (RoleService) InfoOfId(dto dto.GeneralGetDto) model.Role {
	return roleDao.Get(dto.Id, true)
}

// List - users list with pagination
func (RoleService) List(dto dto.GeneralListDto) ([]model.Role, int64) {
	return roleDao.List(dto)
}

// AssignPermission - assign permissions
func (RoleService) AssignPermission(roleId int, menuIds string) {
	roleData := roleDao.Get(roleId, true)
	menus := menuDao.GetMenusPermByIds(menuIds)
	if len(menus) > 0 {
		var policies [][]string
		for _, m := range menus {
			if m.Url == "" && m.Perms != "" {
				//Do not allow comma which would cause panic error with casbin rules
				m.Perms = strings.Replace(m.Perms,",","|",-1)
				policies = append(policies, []string{roleData.RoleName, m.Perms, "*", roleData.Domain.Code})
			}
		}
		role.OverwritePerm(roleData.RoleName, roleData.Domain.Code, policies)
	} else {
		role.DeletePerm(roleData.RoleName)
	}
}

// assign data permission
func (rs RoleService) AssignDataPerm(roleId int, dataPermIds string) error {
	var (
		dtos           []dto.AssignDataPermDto
		dtoOne         dto.AssignDataPermDto
		oldDataPermIds []int
		dataIds        []string
	)

	// Get the old data permission list of the current role
	oldRoleDataPerms, _ := roleDataPermDao.GetByRoleId(roleId)

	// Delete all old data permissions for this role and insert new ones
	if len(oldRoleDataPerms) > 0 {
		for _, v := range oldRoleDataPerms {
			oldDataPermIds = append(oldDataPermIds, v.Id)
		}
		_ = roleDataPermDao.DeleteMulti(roleId, oldDataPermIds)
	}
	// Insert new data permissions
	dataIds = strings.Split(dataPermIds, ",")
	if len(dataIds) > 0 {
		for _, v := range dataIds {
			tmpId, _ := strconv.Atoi(v)
			dtoOne.RoleId = roleId
			dtoOne.DataPermId = tmpId
			dtos = append(dtos, dtoOne)
		}
		_ = roleDataPermDao.InsertMulti(dtos)
	}

	return nil
}

// Create - create a new role
func (rs RoleService) Create(dto dto.RoleCreateDto) (model.Role, error) {
	roleModel := model.Role{
		Name:       dto.Name,
		RoleName:   dto.RoleName,
		Remark:     dto.Remark,
		DomainId:   dto.DomainId,
		MenuIds:    dto.MenuIds,
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
		// insert data permissions
		if len(dto.DataPermIds) > 0 {
			_ = rs.AssignDataPerm(roleModel.Id, dto.DataPermIds)
		}
	}
	return roleModel, nil
}

// Update - update role's information
func (rs RoleService) Update(roleDto dto.RoleEditDto) int64 {
	c := roleDao.Update(&model.Role{Id: roleDto.Id}, map[string]interface{}{
		"name":         roleDto.Name,
		"remark":       roleDto.Remark,
		"domain_id":    roleDto.DomainId,
		"menu_ids":     roleDto.MenuIds,
		"menu_ids_ele": roleDto.MenuIdsEle,
	})
	rs.AssignPermission(roleDto.Id, roleDto.MenuIds)
	if roleDto.DataPermIds != "" {
		_ = rs.AssignDataPerm(roleDto.Id, roleDto.DataPermIds)
	}

	return c.RowsAffected
}

// Delete - delete role
func (rl RoleService) Delete(dto dto.GeneralDelDto) int64 {
	roleModel := roleDao.Get(dto.Id, false)
	if roleModel.Id < 1 {
		return -1
	}
	//1. delete role
	c := roleDao.Delete(&roleModel)
	if c.RowsAffected > 0 {
		//2. delete role's policies
		role.DeletePerm(roleModel.RoleName)

		//3. delete role's data permissions
		_ = roleDataPermDao.DeleteByRoleId(dto.Id)
	}
	return c.RowsAffected
}

// 通过角色id获取数据权限列表
func (rl RoleService) GetRoleDataPermsByRoleId(roleId int) ([]model.GetByRoleIdData, int64) {
	return roleDataPermDao.GetByRoleId(roleId)
}
