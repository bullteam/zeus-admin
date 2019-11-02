package service

import (
	"strings"
	"time"
	"zeus/pkg/api/dao"
	"zeus/pkg/api/domain/perm"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/log"
	"zeus/pkg/api/model"
)

var menuDao = dao.Menu{}
var menuPermAliasDao = dao.MenuPermAlias{}

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
func (ms MenuService) Create(menuDto dto.MenuCreateDto) model.Menu {
	menuModel := model.Menu{
		Name:     menuDto.Name,
		ParentId: menuDto.ParentId,
		DomainId: menuDto.DomainId,
		Url:      menuDto.Url,
		Perms:    menuDto.Perms,
		Alias:    menuDto.Alias,
		MenuType: menuDto.MenuType,
		Icon:     menuDto.Icon,
		OrderNum: menuDto.OrderNum,
	}
	c := menuDao.Create(&menuModel)
	if c.Error != nil {
		log.Error(c.Error.Error())
	}
	for _, alias := range strings.Split(menuDto.Alias, ",") {
		menuPermAliasDao.Create(&model.MenuPermAlias{
			Perms:       menuDto.Perms,
			Alias:       alias,
			DomainId:    menuDto.DomainId,
			CreatedTime: time.Now().Unix(),
			UpdatedTime: time.Now().Unix(),
		})
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
		"alias":     menuDto.Alias,
		"order_num": menuDto.OrderNum,
		"parent_id": menuDto.ParentId,
		"icon":      menuDto.Icon,
	})
	// 1.Remove all alias
	menuPermAliasDao.Delete(model.MenuPermAlias{Perms: menuDto.Perms, DomainId: menuDto.DomainId})
	// 2.Save new alias again
	for _, alias := range strings.Split(menuDto.Alias, ",") {
		menuPermAliasDao.Create(&model.MenuPermAlias{
			Perms:       menuDto.Perms,
			Alias:       alias,
			DomainId:    menuDto.DomainId,
			CreatedTime: time.Now().Unix(),
			UpdatedTime: time.Now().Unix(),
		})
	}
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
		// Remove all alias
		menuPermAliasDao.Delete(model.MenuPermAlias{Perms: menuModel.Perms, DomainId: menuModel.DomainId})
	}
	return c.RowsAffected
}
