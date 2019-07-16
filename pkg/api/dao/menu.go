package dao

import (
	"strings"
	"zeus/pkg/api/model"
)

type Menu struct {
}

func (m Menu) GetMenusByIds(ids string) []model.Menu {
	var menus []model.Menu
	db := GetDb()
	db.Where("id in (?)", strings.Split(ids, ",")).Find(&menus)
	return menus
}
