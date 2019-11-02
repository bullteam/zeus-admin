package dao

import "zeus/pkg/api/model"

type MenuPermAlias struct {
}

// GetByAlias - get single row of alias
func (MenuPermAlias) GetByAlias(alias string, domainId int) model.MenuPermAlias {
	var mpa model.MenuPermAlias
	db := GetDb()
	db.Where("alias = ? and domain_id = ?", alias, domainId).First(&mpa)
	return mpa
}

// GetByPerms - get all aliases rows of specific permission code
func (MenuPermAlias) GetByPerms(perms string) []model.MenuPermAlias {
	var mpa []model.MenuPermAlias
	db := GetDb()
	db.Where("perms = ?", perms).Find(&mpa)
	return mpa
}

// Delete - delete of crud
func (MenuPermAlias) Delete(menuPermAlias model.MenuPermAlias) {
	db := GetDb()
	db.Where("perms = ? and domain_id = ?", menuPermAlias.Perms, menuPermAlias.DomainId).Delete(menuPermAlias)
}

// Create - create of crud
func (MenuPermAlias) Create(menuPermAlias *model.MenuPermAlias) {
	db := GetDb()
	db.Create(menuPermAlias)
}
