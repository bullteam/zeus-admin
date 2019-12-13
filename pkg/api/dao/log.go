package dao

import (
	"time"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/model"
)

type LoginLog = model.LoginLog

type OperationLog = model.OperationLog

type LoginLogList struct {
	Id               int       `json:"id"`
	UserId           int       `json:"user_id" binding:"required"`
	User             User      `json:"user"`
	Client           string    `json:"client"`
	Platform         string    `json:"platform"`
	LoginResult      string    `json:"login_result"`
	LoginStatus      int       `json:"login_status"`
	LoginTime        time.Time `json:"login_time"`
	Ip               string    `json:"ip"`
	IpLocation       string    `json:"ip_location"`
	OperationTime    string    `json:"operation_time"`
	OperationContent string    `json:"operation_content"`
	CreateTime       time.Time `json:"-"`
	LastUpdateTime   time.Time `json:"-"`
	Username         string    `json:"username"`
}

type OperationLogList struct {
	Id               int       `json:"id"`
	LogNo            string    `json:"log_no" binding:"required"`
	Module           string    `json:"module"`
	RequestUrl       string    `json:"request_url"`
	OperationMethod  string    `json:"operation_method"`
	Params           string    `json:"params"`
	ExceptionStack   string    `json:"exception_stack"`
	OperationResult  string    `json:"operation_result"`
	OperationSuccess int       `json:"operation_success"`
	OperationTime    time.Time `json:"operation_time"`
	UserId           int       `json:"user_id"`
	Ip               string    `json:"ip"`
	IpLocation       string    `json:"ip_location"`
	OperationContent string    `json:"operation_content"`
	CreateTime       time.Time `json:"create_time"`
	LastUpdateTime   time.Time `json:"updated_time"`
	Username         string    `json:"username"`
}

type LoginLogDao struct {
}

type OperationLogDao struct {
}

//Get
func (LoginLogDao) Detail(id int) model.LoginLog {
	var loginLog model.LoginLog
	db.Where("id = ?", id).First(&loginLog)
	return loginLog
}

// List
func (LoginLogDao) Lists(listDto dto.LoginLogListDto) ([]LoginLogList, int64) {
	var loginLogList []LoginLogList
	var total int64
	db := GetDb()
	if len(listDto.Username) > 0 {
		db = db.Where("user.username LIKE ?", "%"+listDto.Username+"%")
	}
	if len(listDto.Ip) > 0 {
		db = db.Where("login_log.ip = ?", listDto.Ip)
	}
	if len(listDto.StartTime) > 0 {
		db = db.Where("login_log.login_time >= ?", listDto.StartTime)
	}
	if len(listDto.EndTime) > 0 {
		db = db.Where("login_log.login_time <= ?", listDto.EndTime)
	}
	db.Table("login_log").
		Select("login_log.*,user.username").
		Offset(listDto.Skip).
		Limit(listDto.Limit).
		Order("login_time desc").
		Joins("LEFT JOIN user ON user.id = login_log.user_id").
		Scan(&loginLogList)
	db.Model(&LoginLog{}).Joins("LEFT JOIN user ON user.id = login_log.user_id").Count(&total)
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
func (OperationLogDao) Lists(listDto dto.OperationLogListDto) ([]OperationLogList, int64) {
	var dataModelList []OperationLogList
	var total int64
	db := GetDb()
	if len(listDto.Username) > 0 {
		db = db.Where("user.username LIKE ?", "%"+listDto.Username+"%")
	}
	if len(listDto.Ip) > 0 {
		db = db.Where("operation_log.ip = ?", listDto.Ip)
	}
	if len(listDto.StartTime) > 0 {
		db = db.Where("operation_log.operation_time >= ?", listDto.StartTime)
	}
	if len(listDto.EndTime) > 0 {
		db = db.Where("operation_log.operation_time <= ?", listDto.EndTime)
	}
	db.Table("operation_log").
		Select("operation_log.*,user.username").
		Offset(listDto.Skip).
		Limit(listDto.Limit).
		Order("operation_time desc").
		Joins("LEFT JOIN user ON user.id = operation_log.user_id").
		Scan(&dataModelList)
	db.Model(&OperationLog{}).Joins("LEFT JOIN user ON user.id = operation_log.user_id").Count(&total)
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

func (OperationLogDao) GetLatestLogOfAccount(uid int) model.OperationLog {
	db := GetDb()
	var oLog model.OperationLog
	db.Where("user_id=?",uid).Order("-id").First(&oLog)
	return oLog
}
