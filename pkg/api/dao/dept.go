package dao

import (
	"fmt"
	"github.com/jinzhu/gorm"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/model"
)

type Dept struct {
}

//func (Dept) GetByRole(role model.Role){
//	db := GetDb()
//	db.Where("code",role.Dept.Code)
//}
//Get - get single Dept infoD
func (u Dept) Get(id int) model.Department {
	var Dept model.Department
	db := GetDb()
	db.Where("id = ?", id).First(&Dept)
	return Dept
}

// List - Depts list
func (u Dept) List(listDto dto.GeneralListDto) ([]model.Department, int64) {
	var Depts []model.Department
	var total int64
	db := GetDb()
	for sk, sv := range dto.TransformSearch(listDto.Q, dto.UserListSearchMapping) {
		db = db.Where(fmt.Sprintf("%s = ?", sk), sv)
	}
	db.Offset(listDto.Skip).Limit(listDto.Limit).Find(&Depts)
	db.Model(&model.Department{}).Count(&total)
	return Depts, total
}

// Create - new Dept
func (u Dept) Create(Dept *model.Department) *gorm.DB {
	db := GetDb()
	return db.Save(Dept)
}

// Update - update Dept
func (u Dept) Update(Dept *model.Department, ups map[string]interface{}) *gorm.DB {
	db := GetDb()
	return db.Model(Dept).Updates(ups)
}

// Create - new Dept
func (u Dept) Delete(Dept *model.Department) *gorm.DB {
	db := GetDb()
	return db.Delete(Dept)
}
