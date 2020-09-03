package dao

import (
	"fmt"
	"github.com/jinzhu/gorm"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/model"
)

type Dept struct {
}

// List - Depts list
func (u Dept) List(listDto dto.GeneralListDto) ([]model.Department, int64) {
	var depts []model.Department
	var total int64
	db := GetDb()
	for sk, sv := range dto.TransformSearch(listDto.Q, dto.UserListSearchMapping) {
		db = db.Where(fmt.Sprintf("%s = ?", sk), sv)
	}
	db.Find(&depts)
	db.Model(&model.Department{}).Count(&total)
	return depts, total
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

//
func (u Dept) FindSameLevelParents(rgt int) []model.Department {
	var depts []model.Department
	db := GetDb()
	db.Where("rgt > ?", rgt).Find(&depts)
	return depts
}

// ReGenerate department's tree
func (u Dept) ReGenerateWhole(id int) {
	db := GetDb()
	node := model.Department{}
	db.Where("id = ?", id).First(&node)
	u.Update(&node, map[string]interface{}{
		"lft": 1,
		"rgt": 2,
	})
	u.ReGenerateChilds(id)
}

//
func (u Dept) ReGenerateChilds(pid interface{}) {
	db := GetDb()
	var depts []model.Department
	db.Where("parent_id = ?", pid).Find(&depts)
	for _, v := range depts {
		u.ReGenerateNode(v.Id)
		u.ReGenerateChilds(v.Id)
	}
}

func (u Dept) ReGenerateNode(id interface{}) {
	db := GetDb()
	var node model.Department
	var parent model.Department
	db.Where("id = ?", id).First(&node)
	db.Where("id = ?", node.ParentId).First(&parent)
	var nodes []model.Department
	db.Where("rgt > ?", parent.Rgt).Find(&nodes)
	for _, v := range nodes {
		rgt := v.Rgt
		lft := v.Lft
		level := v.Level
		//level,_ := strconv.Atoi(v["level"].(string))
		up := map[string]interface{}{
			"rgt": rgt + 2,
		}
		if level >= parent.Level {
			up["lft"] = lft + 2
		}
		u.Update(&v, up)
	}
	u.Update(&node, map[string]interface{}{
		"lft": parent.Rgt,
		"rgt": parent.Rgt + 1,
	})
	u.Update(&parent, map[string]interface{}{
		"rgt": parent.Rgt + 2,
	})
}
