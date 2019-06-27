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

type verifyCases struct {
	sourcePwd string
	targetPwd string
	salt      string
	expected  bool
}

func TestMakeSalt(t *testing.T) {
	salt, err = MakeSalt()
	assert.Equal(t, nil, err)
}
func TestHashPassword(t *testing.T) {
	pwd, err = HashPassword(pwd, salt)
	assert.Equal(t, nil, err)
}
func TestVerifyPassword(t *testing.T) {
	for _, cs := range []verifyCases{{
		"zeus", pwd, salt, true,
	}, {
		"zeus0", pwd, salt, false,
	}, {
		"zeus", pwd, "wrong", false,
	}, {
		"zeus", "wrong", salt, false,
	},
	} {
		assert.Equal(t, cs.expected, VerifyPassword(cs.sourcePwd, model.User{
			Password: cs.targetPwd,
			Salt:     cs.salt,
		}), "Cases of password verification")
	}
}

func TestCheckPermission(t *testing.T) {
	assert.Equal(t, true, CheckPermission([]model.Role{{
		RoleName: "role-1",
	}}, Permission{"zone-1", "manage-all-things", "department-1"}), "Permission check of account")
	assert.Equal(t, false, CheckPermission([]model.Role{{
		RoleName: "role-1",
	}}, Permission{"zone-1", "without-permission", "department-1"}), "Permission check of account")
}
