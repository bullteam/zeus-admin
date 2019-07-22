package service

import (
	"zeus/pkg/api/dao"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/log"
	"zeus/pkg/api/model"
)

var dataPermDao = dao.DataPerm{}

// DataPermService
type DataPermService struct {
}

// get info by id
func (DataPermService) InfoOfId(dto dto.GeneralGetDto) model.DataPerm {
	return dataPermDao.Get(dto.Id)
}

// List
func (DataPermService) List(dto dto.GeneralListDto) ([]model.DataPerm, int64) {
	return dataPermDao.List(dto)
}

// Create
func (DataPermService) Create(dto dto.DataPermAddDto) model.DataPerm {
	dpsModel := model.DataPerm{
		DomainId:  dto.DomainId,
		ParentId:  dto.ParentId,
		Name:      dto.Name,
		Perms:     dto.Perms,
		PermsRule: dto.PermsRule,
		PermsType: dto.PermsType,
		OrderNum:  dto.OrderNum,
		Remarks:   dto.Remarks,
	}
	c := dataPermDao.Create(&dpsModel)
	if c.Error != nil {
		log.Error(c.Error.Error())
	}
	return dpsModel
}

// Update
func (DataPermService) Update(dto dto.DataPermEditDto) int64 {
	dpsModel := model.DataPerm{
		Id:        dto.Id,
		DomainId:  dto.DomainId,
		ParentId:  dto.ParentId,
		Name:      dto.Name,
		Perms:     dto.Perms,
		PermsRule: dto.PermsRule,
		PermsType: dto.PermsType,
		OrderNum:  dto.OrderNum,
		Remarks:   dto.Remarks,
	}

	c := dataPermDao.Update(&dpsModel)
	return c.RowsAffected
}

// Delete
func (DataPermService) Delete(dto dto.GeneralDelDto) int64 {
	dpsModel := model.DataPerm{
		Id: dto.Id,
	}
	c := dataPermDao.Delete(&dpsModel)
	return c.RowsAffected
}
