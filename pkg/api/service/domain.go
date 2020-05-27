package service

import (
	"zeus/pkg/api/dao"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/log"
	"zeus/pkg/api/model"
)

var domainDao = dao.DomainDao{}

// DomainService
type DomainService struct {
}

// InfoOfId - get role info by id
func (us DomainService) InfoOfId(dto dto.GeneralGetDto) model.Domain {
	return domainDao.Get(dto.Id)
}

// List - users list with pagination
func (us DomainService) List(dto dto.GeneralListDto) ([]model.Domain, int64) {
	//dto.Q = "id=1"
	//todo : data permission control here with a general handler
	return domainDao.List(dto)
}

// Create - create a new domain
func (us DomainService) Create(dto dto.DomainCreateDto) model.Domain {
	domainModel := model.Domain{
		Name:        dto.Name,
		Callbackurl: dto.Callbackurl,
		Remark:      dto.Remark,
		Code:        dto.Code,
	}
	c := domainDao.Create(&domainModel)
	if c.Error != nil {
		log.Error(c.Error.Error())
	}
	return domainModel
}

// Update - update domain's information
func (us DomainService) Update(dto dto.DomainEditDto) int64 {
	domainModel := model.Domain{
		Id:          dto.Id,
		Name:        dto.Name,
		Callbackurl: dto.Callbackurl,
		Remark:      dto.Remark,
		Code:        dto.Code,
	}

	c := domainDao.Update(&domainModel, map[string]interface{}{
		"name":        dto.Name,
		"callbackurl": dto.Callbackurl,
		"remark":      dto.Remark,
		"code":        dto.Code,
	})
	return c.RowsAffected
}

// Delete - delete domain
func (us DomainService) Delete(dto dto.GeneralDelDto) int64 {
	domainModel := model.Domain{
		Id: dto.Id,
	}
	c := domainDao.Delete(&domainModel)
	return c.RowsAffected
}