package service

import (
	"github.com/spf13/viper"
	"zeus/pkg/api/dto"
)

type InstallService struct {
}

func (us InstallService) Install(dto dto.InstallDTO) bool {
	if viper.GetBool("security.install_lock") {
		return false
	}

	//base
	viper.Set("security.install_lock", true)
	viper.Set("base.siteName", dto.SiteName)
	viper.Set("base.port", dto.Port)
	viper.Set("base.baseUrl", dto.BaseUrl)
	viper.Set("base.logPath", dto.LogPath)
	viper.Set("base.isEnableCode", dto.IsEnableCode)
	viper.Set("base.isEnableAccess", dto.IsEnableAccess)

	//mysql
	viper.Set("database.mysql.host", dto.SqlHost)
	viper.Set("database.mysql.user", dto.SqlUser)
	viper.Set("database.mysql.password", dto.SqlPassword)
	viper.Set("database.mysql.name", dto.SqlName)
	viper.Set("database.mysql.chatset", dto.SqlChatset)
	viper.Set("database.mysql.ssl", dto.SqlSSL)

	//Email
	viper.Set("email.smtp.port", dto.Port)
	viper.Set("email.smtp.address", dto.SmtpAddress)
	viper.Set("email.smtp.password", dto.SmtpPassword)
	viper.Set("email.smtp.server", dto.SmtpServer)
	viper.Set("email.smtp.user", dto.SmtpUser)

	err := viper.WriteConfig()
	if err == nil {
		return true
	}
	return false
}

func (us InstallService) Islock() bool {
	return viper.GetBool("security.install_lock")
}
