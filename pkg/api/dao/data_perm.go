package dao

import (
	"fmt"
	"github.com/jinzhu/gorm"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/model"
)

type DataPerm struct {
}

//Get
func (dp DataPerm) Get(id int) model.DataPerm {
	var dataPerm model.DataPerm
	db := GetDb()
	db.Where("id = ?", id).First(&dataPerm)
	return dataPerm
}

// List
func (dp DataPerm) List(listDto dto.GeneralListDto) ([]model.DataPerm, int64) {
	var dataPerms []model.DataPerm
	var total int64
	db := GetDb()
	for sk, sv := range dto.TransformSearch(listDto.Q, dto.DataPermListSearchMapping) {
		db = db.Where(fmt.Sprintf("%s = ?", sk), sv)
	}
	db.Offset(listDto.Skip).Limit(listDto.Limit).Find(&dataPerms)
	db.Model(&model.DataPerm{}).Count(&total)
	return dataPerms, total
}

// Create
func (dp DataPerm) Create(dataPerm *model.DataPerm) *gorm.DB {
	db := GetDb()
	return db.Save(dataPerm)
}

// Update
func (dp DataPerm) Update(dataPerm *model.DataPerm) *gorm.DB {
	db := GetDb()
	return db.Save(dataPerm)
}

// Create
func (dp DataPerm) Delete(dataPerm *model.DataPerm) *gorm.DB {
	db := GetDb()
	return db.Delete(dataPerm)
}
