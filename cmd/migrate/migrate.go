// Initialize & migrate departments & users & maybe other stuffs
package migrate

import (
	"fmt"
	"github.com/rs/zerolog"
	"github.com/spf13/cobra"
	"github.com/spf13/viper"
	"io/ioutil"
	"os"
	"strings"
	"zeus/pkg/api/dao"
	"zeus/pkg/api/domain/sync/dingdingtalk"
	"zeus/pkg/api/log"
	"zeus/pkg/api/service"
)

var (
	config   string
	from 	string
    dingTalkService service.DingTalkService
	hang = make(chan struct{})
	MigrateCmd = &cobra.Command{
		Use: "migrate",
		Short: "Initialize data before whole system ready(run once)",
		Example: "migrate -f dingtalk -c config/in-local.yaml",
		PreRun: func(cmd *cobra.Command, args []string) {
			dingTalkService = service.DingTalkService{}
		},
		RunE: func(cmd *cobra.Command, args []string) error {
			setup()
			run()
			<-hang
			return nil
		},
	}
)
func init() {
	MigrateCmd.PersistentFlags().StringVarP(&config, "config", "c", "./config/in-local.yaml", "Start server with provided configuration file")
	MigrateCmd.PersistentFlags().StringVarP(&from, "from", "f", "dingtalk", "dingtalk-钉钉数据,wx-微信数据(not ready)")
}
func run() error {
	dingTalkService.SyncUsersAndDepartments()
	return nil
}
func setup() {
	//1.Set up log level
	zerolog.SetGlobalLevel(zerolog.Level(0))
	//2.Set up configuration
	viper.SetConfigFile(config)
	content, err := ioutil.ReadFile(config)
	if err != nil {
		log.Fatal(fmt.Sprintf("Read config file fail: %s", err.Error()))
	}
	//Replace environment variables
	err = viper.ReadConfig(strings.NewReader(os.ExpandEnv(string(content))))
	if err != nil {
		log.Fatal(fmt.Sprintf("Parse config file fail: %s", err.Error()))
	}
	//3.Set up database connection
	dao.Setup()
	//4.Set up dingdingtalk client
	dingdingtalk.SetUp()
}


