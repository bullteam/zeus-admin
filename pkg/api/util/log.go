
package components

import (
	"github.com/sevenNt/wzap"
	"github.com/spf13/viper"
)

// Init initializes log pkg.
func Init() {
	logger := wzap.New(
		wzap.WithOutputKV(viper.GetStringMap("logger.console")),
		wzap.WithOutputKV(viper.GetStringMap("logger.zap")),
	)
	wzap.SetDefaultLogger(logger)
}

// Debug logs debug level messages with default logger.
func Debug(msg string, args ...interface{}) {
	wzap.Debug(msg, args...)
}

// Info logs Info level messages with default logger in structured-style.
func Info(msg string, args ...interface{}) {
	wzap.Info(msg, args...)
}

// Warn logs Warn level messages with default logger in structured-style.
func Warn(msg string, args ...interface{}) {
	wzap.Warn(msg, args...)
}

// Error logs Error level messages with default logger in structured-style.
// Notice: additional stack will be added into messages.
func Error(msg string, args ...interface{}) {
	wzap.Error(msg, args...)
}

// Panic logs Panic level messages with default logger in structured-style.
// Notice: additional stack will be added into messages, meanwhile logger will panic.
func Panic(msg string, args ...interface{}) {
	wzap.Panic(msg, args...)
}

// Fatal logs Fatal level messages with default logger in structured-style.
// Notice: additional stack will be added into messages, then calls os.Exit(1).
func Fatal(msg string, args ...interface{}) {
	wzap.Fatal(msg, args...)
}
