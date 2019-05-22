package api

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/spf13/cobra"
	"github.com/spf13/viper"
	"os"
	"os/signal"
	"syscall"
	"zeus/pkg/api/router"
	"zeus/pkg/api/util"
)

var (
	StartCmd = &cobra.Command{
		Use:     "start",
		Short:   "Start zeus API server",
		Example: "zeus start -c config/in-local.toml",
		RunE:    start,
	}
)

func init() {
	StartCmd.PersistentFlags().StringVarP(&components.Args.ConfigFile, "config", "c", "config/in-local.toml", "Start server with provided configuration file")
}

func start(_ *cobra.Command, _ []string) error {
	usage()
	parseConfig()
	components.Init()
	mode := viper.GetString("mode")
	gin.SetMode(mode)
	components.SetDebug(mode)
	quit := make(chan os.Signal)
	signal.Notify(quit, syscall.SIGINT, syscall.SIGTERM)
	engine := gin.Default()
	router.Init(engine)
	return nil
}
func usage() {
	usageStr := `
  ______              
 |___  /              
    / / ___ _   _ ___ 
   / / / _ \ | | / __|
  / /_|  __/ |_| \__ \
 /_____\___|\__,_|___/
`
	fmt.Printf("%s\n", usageStr)
}

func parseConfig() {
	viper.SetConfigFile(components.Args.ConfigFile)
	err := viper.ReadInConfig()
	if err != nil {
		panic(fmt.Errorf("parse config file fail: %s", err))
	}
	components.Info("[Args]", "ConfigFile", components.Args.ConfigFile)
	println()
}