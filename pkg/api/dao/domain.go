package dao

import (
	"fmt"
	"github.com/jinzhu/gorm"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/model"
)

type DomainDao struct {
}

//Get - get single domain infoD
func (u DomainDao) Get(id int) model.Domain {
	var domain model.Domain
	db := GetDb()
	db.Where("id = ?", id).First(&domain)
	return domain
}

// List - Domains list
func (u DomainDao) List(listDto dto.GeneralListDto) ([]model.Domain, int64) {
	var domains []model.Domain
	var total int64
	db := GetDb()
	for sk, sv := range dto.TransformSearch(listDto.Q, dto.UserListSearchMapping) {
		db = db.Where(fmt.Sprintf("%s = ?", sk), sv)
	}
	db.Preload("Domain").Offset(listDto.Skip).Limit(listDto.Limit).Find(&domains)
	db.Model(&model.Domain{}).Count(&total)
	return domains, total
}

// Create - new Domain
func (u DomainDao) Create(domain *model.Domain) *gorm.DB {
	db := GetDb()
	return db.Save(domain)
}

// Update - update Domain
func (u DomainDao) Update(domain *model.Domain) *gorm.DB {
	db := GetDb()
	return db.Save(domain)
}

// Create - new Domain
func (u DomainDao) Delete(domain *model.Domain) *gorm.DB {
	db := GetDb()
	return db.Delete(domain)
}
