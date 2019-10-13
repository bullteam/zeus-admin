package dao

import (
	"fmt"
	"github.com/jinzhu/gorm"
	"strings"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/model"
)

type Menu struct {
}

// GetMenusByIds
func (m Menu) GetMenusByIds(ids string) []model.Menu {
	var menus []model.Menu
	db := GetDb()
	db.Where("id in (?) and menu_type=1", strings.Split(ids, ",")).Find(&menus)
	return menus
}

//Get - get single menu info
func (m Menu) Get(id int, preload bool) model.Menu {
	var menu model.Menu
	db := GetDb()
	if preload {
		db = db.Preload("Domain")
	}
	db.Where("id = ?", id).First(&menu)
	return menu
}

//GetSubMenus
func (m Menu) GetSubMenus(id int) []model.Menu {
	var menus []model.Menu
	db := GetDb()
	db.Where("parent_id=?", id).First(&menus)
	return menus
}

// List
func (m Menu) List(treeDto dto.GeneralTreeDto) ([]model.Menu, int64) {
	var menus []model.Menu
	var total int64
	db := GetDb()
	for sk, sv := range dto.TransformSearch(treeDto.Q, dto.MenuListSearchMapping) {
		db = db.Where(fmt.Sprintf("%s = ?", sk), sv)
	}
	db.Preload("Domain").Order("order_num asc").Find(&menus)
	db.Model(&model.Menu{}).Count(&total)
	return menus, total
}

// Create - new menu
func (m Menu) Create(menu *model.Menu) *gorm.DB {
	db := GetDb()
	return db.Save(menu)
}

// Update - update menu
func (m Menu) Update(menu *model.Menu, ups map[string]interface{}) *gorm.DB {
	db := GetDb()
	return db.Model(menu).Update(ups)
}

// Delete - delete menu
func (m Menu) Delete(menu *model.Menu) *gorm.DB {
	db := GetDb()
	return db.Delete(menu)
}
