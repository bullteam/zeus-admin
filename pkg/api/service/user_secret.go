package service

import (
	"zeus/pkg/api/dao"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/log"
	"zeus/pkg/api/model"
)

var userSecretDao = dao.UserSecretDao{}

// DomainService
type userSecretService struct {

}

// InfoOfId - get role info by id
func (us userSecretService) InfoOfId(dto dto.GeneralGetDto) model.UserSecret {
	return userSecretDao.Get(dto.Id)
}

// Create - create a new domain
func (us userSecretService) Create(dto dto.UserSecretCreateDto) model.UserSecret {
	userSecret := model.UserSecret{
		User_id:      dto.User_id,
		Account_name: dto.Account_name,
		Secret:       dto.Secret,
	}
	c := userSecretDao.Create(&userSecret)
	if c.Error != nil {
		log.Error(c.Error.Error())
	}
	return userSecret
}
