package service

import (
	"zeus/pkg/api/dao"
	"zeus/pkg/api/domain/perm"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/log"
	"zeus/pkg/api/model"
)

var menuDao = dao.Menu{}

type MenuService struct {
}

// InfoOfId - get menu info by id
func (MenuService) InfoOfId(dto dto.GeneralGetDto) model.Menu {
	return menuDao.Get(dto.Id, true)
}

// List - users list with pagination
func (MenuService) List(treeDto dto.GeneralTreeDto) ([]model.Menu, int64) {
	return menuDao.List(treeDto)
}

// Create - create a menu item
func (ms MenuService) Create(dto dto.MenuCreateDto) model.Menu {
	menuModel := model.Menu{
		Name:     dto.Name,
		ParentId: dto.ParentId,
		DomainId: dto.DomainId,
		Url:      dto.Url,
		Perms:    dto.Perms,
		MenuType: dto.MenuType,
		Icon:     dto.Icon,
		OrderNum: dto.OrderNum,
	}
	c := menuDao.Create(&menuModel)
	if c.Error != nil {
		log.Error(c.Error.Error())
	}
	return menuModel
}

// Update
func (ms MenuService) Update(menuDto dto.MenuEditDto) int64 {
	menuModel := menuDao.Get(menuDto.Id, false)
	c := menuDao.Update(&menuModel, map[string]interface{}{
		"name":      menuDto.Name,
		"url":       menuDto.Url,
		"perms":     menuDto.Perms,
		"order_num": menuDto.OrderNum,
		"parent_id": menuDto.ParentId,
		"icon":      menuDto.Icon,
	})
	return c.RowsAffected
}

// Delete - delete menu
func (ms MenuService) Delete(dto dto.GeneralDelDto) int64 {
	menuModel := menuDao.Get(dto.Id, false)
	if menuModel.Id < 1 {
		return -1
	}
	//If menu has sub menus , stop removing node
	subMenus := menuDao.GetSubMenus(dto.Id)
	if len(subMenus) > 0 {
		return -2
	}
	//1. delete menu
	perms := menuModel.Perms
	c := menuDao.Delete(&menuModel)
	if c.RowsAffected > 0 {
		//2. delete related policies
		//Empty perms puts in delete method would cause all casbin rules removed!
		if perms != "" {
			perm.DelFilteredPerm(1, perms)
		}
	}
	return c.RowsAffected
}
