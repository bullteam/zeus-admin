package controllers

import (
	"fmt"
	"github.com/gin-gonic/gin"
	//"github.com/spf13/viper"
	"zeus/pkg/api/dto"
)

type InstallController struct {
	BaseController
}

func (i *InstallController) Install(c *gin.Context) {
	//viper.Set("test.test", "1111")
	//err := viper.WriteConfig()
	var InstallDTO dto.InstallDTO
	if i.BindAndValidate(c, &InstallDTO) {
		fmt.Println(InstallDTO)
	}
	resp(c, map[string]interface{}{
		"result": InstallDTO,
	})
}
