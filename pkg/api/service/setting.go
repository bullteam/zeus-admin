package service

import (
	"github.com/spf13/viper"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/model"
)

type SettingService struct {
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
