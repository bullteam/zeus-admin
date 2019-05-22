package cmd

import (
	apiserver "zeus/cmd/api"
	"github.com/spf13/cobra"
	"os"
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
	rootCmd.AddCommand(apiserver.StartCmd)
}

func Execute() {
	if err := rootCmd.Execute(); err != nil {
		os.Exit(-1)
	}
}
