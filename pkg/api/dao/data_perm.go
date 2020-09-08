package dao

import (
	"github.com/jinzhu/gorm"
	"zeus/pkg/api/domain/search/parser"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/model"
)

type DataPerm struct{}

// List
func (dp DataPerm) List(listDto dto.GeneralListDto) ([]model.DataPerm, int64) {
	var dataPerms []model.DataPerm
	var total int64
	db := GetDb()
	ps, err := parser.Parse(listDto.Q)
	if err == nil {
		for _, sv := range searchAdapter.GenerateConditions(ps, dto.DataPermListSearchMapping) {
			k := sv[0].(string)
			db = db.Where(k, sv[1:]...)
		}
	}
	db.Offset(listDto.Skip).Limit(listDto.Limit).Find(&dataPerms)
	db.Model(&model.DataPerm{}).Count(&total)
	return dataPerms, total
}

//Get
func (dp DataPerm) Get(id int) model.DataPerm {
	var dataPerm model.DataPerm
	db := GetDb()
	db.Where("id = ?", id).First(&dataPerm)
	return dataPerm
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

func (dp DataPerm) GetDataPermsByRoute(route string) []model.DataPerm {
	data, _ := dp.List(dto.GeneralListDto{
		Q:     "r=" + route,
		Limit: 9999999,
	})
	return data
}
