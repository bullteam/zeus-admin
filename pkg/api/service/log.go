package service

import (
	"time"
	"zeus/pkg/api/dao"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/model"
)

type LoginLog = model.LoginLog
type OperationLog = model.OperationLog

var loginLogDao = dao.LoginLogDao{}
var operationLogDao = dao.OperationLogDao{}

// LogService
type LogService struct {
}

// LoginLogDetail log login detail
func (LogService) LoginLogDetail(dto dto.GeneralGetDto) LoginLog {
	return loginLogDao.Detail(dto.Id)
}

// List - users list with pagination
func (LogService) LoginLogLists(dto dto.LoginLogListDto) ([]dao.LoginLogList, int64) {
	return loginLogDao.Lists(dto)
}

func (LogService) OperationLogDetail(dto dto.GeneralGetDto) OperationLog {
	return operationLogDao.Detail(dto.Id)
}

// List - users list with pagination
func (LogService) OperationLogLists(dto dto.OperationLogListDto) ([]dao.OperationLogList, int64) {
	return operationLogDao.Lists(dto)
}

//Insert Operation Log
func (LogService) InsertOperationLog(orLogDto *dto.OperationLogDto) error {
	return operationLogDao.Create(orLogDto)
}

// CheckIdleTooLong check duration between now and  last action time
// true - means too long time user not doing anything,we should kick user out of admin pages
func (LogService) CheckAccountIdleTooLong(uDto dto.GeneralGetDto) bool {
	// pick the latest access record of account
	// then judge if it pass over 1 hour
	oLog := operationLogDao.GetLatestLogOfAccount(uDto.Id)
	if time.Now().Sub(oLog.CreateTime).Seconds() > 24 * 3600 {
		return false
	}
	return true
}