package cmd

import (
	"github.com/spf13/cobra"
	"os"
	"zeus/cmd/api"
)

var rootCmd = &cobra.Command{
	Use:               "zeus",
	Short:             "zeus API server",
	SilenceUsage:      true,
	DisableAutoGenTag: true,
	Long:              `Start zeus API server`,
	PersistentPreRunE: func(*cobra.Command, []string) error { return nil },
}

func init() {
	rootCmd.AddCommand(api.StartCmd)
}

//Execute : run commands
func Execute() {
	if err := rootCmd.Execute(); err != nil {
		os.Exit(-1)
	}
}
