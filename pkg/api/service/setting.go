package service

import (
	"encoding/json"
	dingtalk "github.com/bullteam/go-dingtalk/src"
	"github.com/spf13/viper"
	"zeus/pkg/api/domain/dept/sync"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/log"

	//"zeus/pkg/api/log"
	"zeus/pkg/api/model"
)

type SettingService struct {
}

type Department struct {
	Id       int
	Name     string
	ParentId int
	Children []*Department
}

func (s SettingService) GetLdap() model.LdapSetting {
	ldapSetting := model.LdapSetting{}
	ldapSetting.LdapUrl = viper.GetString("ldap.addr")
	ldapSetting.LdapFilter = viper.GetString("ldap.authfilter")
	ldapSetting.LdapBaseDN = viper.GetString("ldap.basedn")
	ldapSetting.LdapSearchDN = viper.GetString("ldap.binddn")
	ldapSetting.LdapSearchPassword = viper.GetString("ldap.bindpass")
	ldapSetting.LdapUID = viper.GetString("ldap.userdn")
	return ldapSetting
}

func (s SettingService) LdapUpdate(SettingDTO dto.SettingDTO) bool {
	viper.Set("ldap.addr", SettingDTO.LdapUrl)
	//viper.Set("ldap.attributes", "")
	viper.Set("ldap.authfilter", SettingDTO.LdapFilter)
	viper.Set("ldap.basedn", SettingDTO.LdapBaseDN)
	viper.Set("ldap.binddn", SettingDTO.LdapSearchDN)
	viper.Set("ldap.bindpass", SettingDTO.LdapSearchPassword)
	viper.Set("ldap.userdn", SettingDTO.LdapUID)

	err := viper.WriteConfig()
	if err == nil {
		return true
	}
	return false
}

func (s SettingService) GetEmail() model.EmailSetting {
	emailSetting := model.EmailSetting{}
	emailSetting.Port = viper.GetInt("email.smtp.port")
	emailSetting.SmtpAddress = viper.GetString("email.smtp.address")
	emailSetting.SmtpPassword = viper.GetString("email.smtp.password")
	emailSetting.SmtpServer = viper.GetString("email.smtp.server")
	emailSetting.SmtpUser = viper.GetString("email.smtp.user")
	return emailSetting
}

func (s SettingService) EmailUpdate(SettingDTO dto.EmailSettingDTO) bool {
	//Email
	viper.Set("email.smtp.port", SettingDTO.Port)
	viper.Set("email.smtp.address", SettingDTO.SmtpAddress)
	viper.Set("email.smtp.password", SettingDTO.SmtpPassword)
	viper.Set("email.smtp.server", SettingDTO.SmtpServer)
	viper.Set("email.smtp.user", SettingDTO.SmtpUser)

	err := viper.WriteConfig()
	if err == nil {
		return true
	}
	return false
}

// sync dept
func (s SettingService) SyncDingtalk() bool {
	deptinfos, _ := sync.GetDingTalkUserInfo()
	depts := deptinfos.([]dingtalk.Department)
	res, _ := NodeDataMerge(depts, 0)
	SyncDept(res, 0, 1)
	return true
}

//Recursive node for dept
func NodeDataMerge(nodeList []dingtalk.Department, pid int) (dataList []*Department, err error) {
	for _, v := range nodeList {
		if v.ParentId == pid {
			children, _ := NodeDataMerge(nodeList, v.Id)
			parent := Department{Id: v.Id, ParentId: v.ParentId, Name: v.Name, Children: children}
			dataList = append(dataList, &parent)
		}
	}
	return dataList, nil
}

//Recursive insert into db
func SyncDept(dataList []*Department, pid int, deptId int) {
	for _, vv := range dataList {
		var exts Department
		exts.Id = vv.Id
		exts.Name = vv.Name
		exts.ParentId = vv.ParentId
		extendField, _ := json.Marshal(exts)
		insertDataDept(deptId, vv.Name, pid, string(extendField))
		deptId++
		if len(vv.Children) > 0 {
			pid = deptId - 1
			SyncDept(vv.Children, pid, deptId)
		}
	}
}

func insertDataDept(id int, name string, parentId int, extendField string) bool {
	deptModel := model.Department{
		Id:          id,
		Name:        name,
		ParentId:    parentId,
		OrderNum:    0,
		ExtendField: extendField,
	}
	c := deptDao.Create(&deptModel)
	if c.Error != nil {
		log.Error(c.Error.Error())
		return false
	}
	return true
}
