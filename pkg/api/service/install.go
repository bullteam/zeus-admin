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
	viper.Set("security.install_lock", true)
	viper.Set("base.siteName", dto.SiteName)
	viper.Set("base.port", dto.Port)
	viper.Set("base.baseUrl", dto.BaseUrl)
	viper.Set("base.logPath", dto.LogPath)
	err := viper.WriteConfig()
	if err == nil {
		return true
	}
	return false
}
