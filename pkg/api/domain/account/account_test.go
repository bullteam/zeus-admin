package account

import (
	"github.com/stretchr/testify/assert"
	"testing"
	"zeus/pkg/api/domain/perm"
	"zeus/pkg/api/model"
)

var (
	salt = ""
	pwd  = "zeus"
	err  error
)

func init() {
	perm.SetUpForTest("../perm")
}

func TestMakeSalt(t *testing.T) {
	salt, err = MakeSalt()
	assert.Equal(t, nil, err)
}
func TestHashPassword(t *testing.T) {
	pwd, err = HashPassword(pwd, salt)
	assert.Equal(t, nil, err)
}
func TestCheckPermission(t *testing.T) {
	assert.Equal(t, true, CheckPermission([]model.Role{{
		RoleName: "role-1",
	}}, Permission{"zone-1", "manage-all-things", "department-1"}), "Permission check of account")
	assert.Equal(t, false, CheckPermission([]model.Role{{
		RoleName: "role-1",
	}}, Permission{"zone-1", "without-permission", "department-1"}), "Permission check of account")
}
