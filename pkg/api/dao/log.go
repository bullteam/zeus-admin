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

/*	for sk, sv := range listDto.TransformSearch(map[string]string{
		"n": "username",
		"d": "department_id",
	}) {
		db = db.Where(fmt.Sprintf("%s = ?", sk), sv)
	}*/
	db.Offset(listDto.Offset).Limit(listDto.Limit).Find(&loginLogList)
	db.Model(&LoginLog{}).Count(&total)
	return loginLogList, total
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

	/*	for sk, sv := range listDto.TransformSearch(map[string]string{
			"n": "username",
			"d": "department_id",
		}) {
			db = db.Where(fmt.Sprintf("%s = ?", sk), sv)
		}*/
	db.Offset(listDto.Offset).Limit(listDto.Limit).Find(&dataModelList)
	db.Model(&OperationLog{}).Count(&total)
	return dataModelList, total
}


