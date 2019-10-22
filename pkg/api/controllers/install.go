package controllers

import (
	"github.com/gin-gonic/gin"
	"github.com/spf13/viper"
)

type InstallController struct {
	BaseController
}

func (i *InstallController) Install(c *gin.Context) {
	viper.Set("test.test", "1111")
	err := viper.WriteConfig()
	resp(c, map[string]interface{}{
		"result": err,
	})
}
