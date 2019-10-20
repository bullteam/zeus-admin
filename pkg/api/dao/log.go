package dao

import (
	"zeus/pkg/api/dto"
	"zeus/pkg/api/model"
)

type LoginLog = model.LoginLog
type OperationLog = model.OperationLog

type LoginLogDao struct {
}

type OperationLogDao struct {
}

//Get
func (LoginLogDao) Detail(id int) LoginLog {
	var loginLog LoginLog
	db.Where("id = ?", id).First(&loginLog)
	return loginLog
}

// List
func (LoginLogDao) Lists(listDto dto.GeneralListDto) ([]LoginLog, int64) {
	var loginLogList []LoginLog
	var total int64
	db := GetDb()

	db.Offset(listDto.Skip).Limit(listDto.Limit).Find(&loginLogList)
	db.Model(&LoginLog{}).Count(&total)
	return loginLogList, total
}

// Insert Login Log
func (LoginLogDao) Create(loginLogDto *dto.LoginLogDto) error {
	db := GetDb()
	loginLogModel := model.LoginLog{
		UserId:           loginLogDto.UserId,
		Client:           loginLogDto.Client,
		Platform:         loginLogDto.Platform,
		Ip:               loginLogDto.Ip,
		IpLocation:       loginLogDto.IpLocation,
		LoginResult:      loginLogDto.LoginResult,
		LoginStatus:      loginLogDto.LoginStatus,
		OperationContent: loginLogDto.OperationContent,
	}
	return db.Create(&loginLogModel).Error
}

//Get
func (OperationLogDao) Detail(id int) OperationLog {
	var dataModel OperationLog
	db.Where("id = ?", id).First(&dataModel)
	return dataModel
}

// List
func (OperationLogDao) Lists(listDto dto.GeneralListDto) ([]OperationLog, int64) {
	var dataModelList []OperationLog
	var total int64
	db := GetDb()

	db.Offset(listDto.Skip).Limit(listDto.Limit).Find(&dataModelList)
	db.Model(&OperationLog{}).Count(&total)
	return dataModelList, total
}

// Insert OperationLog
func (ol OperationLogDao) Create(orLogDto *dto.OperationLogDto) error {
	db := GetDb()
	operationLogModel := model.OperationLog{
		RequestUrl:       orLogDto.RequestUrl,
		OperationMethod:  orLogDto.OperationMethod,
		Params:           orLogDto.Params,
		OperationResult:  orLogDto.OperationResult,
		OperationSuccess: orLogDto.OperationSuccess,
		UserId:           orLogDto.UserId,
		Ip:               orLogDto.Ip,
		IpLocation:       orLogDto.IpLocation,
		OperationContent: orLogDto.OperationContent,
	}
	return db.Create(&operationLogModel).Error
}
