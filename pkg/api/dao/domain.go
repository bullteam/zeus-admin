package dao

import (
	"fmt"
	"github.com/jinzhu/gorm"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/model"
)

type Domain struct {
}

//func (Domain) GetByRole(role model.Role){
//	db := GetDb()
//	db.Where("code",role.Domain.Code)
//}
//Get - get single domain infoD
func (u Domain) Get(id int) model.Domain {
	var domain model.Domain
	db.Where("id = ?", id).First(&domain)
	return domain
}

// List - Domains list
func (u Domain) List(listDto dto.GeneralListDto) ([]model.Domain, int64) {
	var domains []model.Domain
	var total int64
	db := GetDb()
	for sk, sv := range listDto.TransformSearch(dto.UserListSearchMapping) {
		db = db.Where(fmt.Sprintf("%s = ?", sk), sv)
	}
	db.Preload("Domain").Offset(listDto.Skip).Limit(listDto.Limit).Find(&domains)
	db.Model(&model.Domain{}).Count(&total)
	return domains, total
}

// Create - new Domain
func (u Domain) Create(domain *model.Domain) *gorm.DB {
	db := GetDb()
	return db.Save(domain)
}

// Update - update Domain
func (u Domain) Update(domain *model.Domain) *gorm.DB {
	db := GetDb()
	return db.Save(domain)
}

// Create - new Domain
func (u Domain) Delete(domain *model.Domain) *gorm.DB {
	db := GetDb()
	return db.Delete(domain)
}