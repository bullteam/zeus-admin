package dao

import (
	"strings"
	"zeus/pkg/api/model"
)

type Menu struct {
}

func (Menu) GetMenusByIds(ids string) []model.Menu {
	var menus []model.Menu
	db.Where("id in (?)", strings.Split(ids, ",")).Find(&menus)
	return menus
}
