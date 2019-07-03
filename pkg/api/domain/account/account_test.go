package account

import (
	"github.com/stretchr/testify/assert"
	"testing"
)

var (
	salt = ""
	pwd  = "zeus"
	err  error
)

func TestMakeSalt(t *testing.T) {
	salt, err = MakeSalt()
	assert.Equal(t, nil, err)
}
func TestHashPassword(t *testing.T) {
	pwd, err = HashPassword(pwd, salt)
	assert.Equal(t, nil, err)
}
