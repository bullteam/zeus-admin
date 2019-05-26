package log

import (
	"fmt"
	"github.com/rs/zerolog"
	"os"
	"strings"
)

const timeFormat = "2006-01-02 15:04:05"

var log zerolog.Logger

func init() {
	zerolog.CallerSkipFrameCount = 3
	output := zerolog.ConsoleWriter{Out: os.Stdout, TimeFormat: timeFormat}
	output.FormatLevel = func(i interface{}) string {
		return strings.ToUpper(fmt.Sprintf(" | %s", i))
	}
	output.FormatMessage = func(i interface{}) string {
		return fmt.Sprintf(" | %s", i)
	}
	output.FormatFieldName = func(i interface{}) string {
		return fmt.Sprintf(" %s:", i)
	}
	output.FormatFieldValue = func(i interface{}) string {
		return strings.ToUpper(fmt.Sprintf("%s ", i))
	}
	output.FormatCaller = func(i interface{}) string {
		var c string
		if cc, ok := i.(string); ok {
			c = cc
		}
		if len(c) > 0 {
			cwd, err := os.Getwd()
			if err == nil {
				c = strings.TrimPrefix(c, cwd)
				c = strings.TrimPrefix(c, "/")
			}
		}
		return "| " + c
	}
	log = zerolog.New(output).With().Timestamp().Logger()

}

//Debug : Level 0
func Debug(msg string) {
	log.Debug().Caller().Msg(msg)
}

//Info : Level 1
func Info(msg string) {
	log.Info().Caller().Msg(msg)
}

//Warn : Level 2
func Warn(msg string) {
	log.Warn().Caller().Msg(msg)
}

//Error : Level 3
func Error(msg string) {
	log.Error().Caller().Msg(msg)
}

//Fatal : Level 4
func Fatal(msg string) {
	log.Fatal().Caller().Msg(msg)
}

// todo : if need more complex log's function then just implements new ones .
