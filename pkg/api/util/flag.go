package components

var debug bool

var Args args

type args struct {
	ConfigFile string
}

// SetDebug sets application running mode.
func SetDebug(mode string) {
	if mode == "debug" {
		debug = true
	}
}

// Debug returns application running mode.
func Debug() bool {
	return debug
}
