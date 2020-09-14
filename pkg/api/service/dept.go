package service

import (
	"zeus/pkg/api/dao"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/log"
	"zeus/pkg/api/model"
)

var deptDao = dao.Dept{}

// DeptService
type DeptService struct {
}

// InfoOfId - get dept info by id
func (us DeptService) InfoOfId(dto dto.GeneralGetDto) model.Department {
	return deptDao.Get(dto.Id)
}

// List - users list with pagination
func (us DeptService) List(dto dto.GeneralListDto) ([]model.Department, int64) {
	return deptDao.List(dto)
}

// Create - create a new dept
func (us DeptService) Create(dto dto.DeptCreateDto) model.Department {
	parentNode := deptDao.Get(dto.ParentId)

	// update parent siblings node's  lft and rgt
	// all parents move right
	for _, d := range deptDao.FindSameLevelParents(parentNode.Rgt) {
		up := map[string]interface{}{
			"rgt": d.Rgt + 2,
		}
		if d.Level >= parentNode.Level {
			up["lft"] = d.Lft + 2
		}
		deptDao.Update(&d, up)
	}
	path := parentNode.Path + " / " + dto.Name
	if dto.ParentId == 0 {
		path = dto.Name
	}
	deptModel := model.Department{
		Name:     dto.Name,
		ParentId: dto.ParentId,
		OrderNum: dto.OrderNum,
		Lft:      parentNode.Rgt,
		Rgt:      parentNode.Rgt + 1,
		Level:    parentNode.Level + 1,
		Path:     path,
	}
	c := deptDao.Create(&deptModel)
	if c.Error != nil {
		log.Error(c.Error.Error())
	}
	deptDao.Update(&parentNode, map[string]interface{}{
		"rgt": parentNode.Rgt + 2,
	})
	return deptModel
}

// Update - update dept's information
func (us DeptService) Update(dto dto.DeptEditDto) int64 {
	parentNode := deptDao.Get(dto.ParentId)
	deptModel := model.Department{
		Id: dto.Id,
	}
	path := parentNode.Path + " / " + dto.Name
	if dto.ParentId == 0 {
		path = dto.Name
	}
	c := deptDao.Update(&deptModel, map[string]interface{}{
		"name":     dto.Name,
		"parentId": dto.ParentId,
		"orderNum": dto.OrderNum,
		"level":    parentNode.Level + 1,
		"path":     path,
	})
	return c.RowsAffected
}

func (us DeptService) Rebuild(dto dto.GeneralGetDto) {
	deptDao.ReGenerateWhole(dto.Id)
}

// Delete - delete dept
func (us DeptService) Delete(dto dto.GeneralDelDto) int64 {
	c := deptDao.Delete(&model.Department{
		Id: dto.Id,
	})
	return c.RowsAffected
}

// check - check has member TODO
func (us DeptService) CheckIfPeopleInside(dto dto.GeneralDelDto) int64 {
	return 0
}
