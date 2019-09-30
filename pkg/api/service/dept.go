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
	deptModel := model.Department{
		Name:     dto.Name,
		ParentId: dto.ParentId,
		OrderNum: dto.OrderNum,
	}
	c := deptDao.Create(&deptModel)
	if c.Error != nil {
		log.Error(c.Error.Error())
	}
	return deptModel
}

// Update - update dept's information
func (us DeptService) Update(dto dto.DeptEditDto) int64 {
	deptModel := model.Department{
		Id:       dto.Id,
	}

	c := deptDao.Update(&deptModel, map[string]interface{}{
		"name":        dto.Name,
		//"parentId": dto.ParentId,
		"orderNum": dto.OrderNum,
	})
	return c.RowsAffected
}

// Delete - delete dept
func (us DeptService) Delete(dto dto.GeneralDelDto) int64 {
	deptModel := model.Department{
		Id: dto.Id,
	}
	c := deptDao.Delete(&deptModel)
	return c.RowsAffected
}
