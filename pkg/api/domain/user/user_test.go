package user

import (
	"github.com/stretchr/testify/assert"
	"testing"
	"zeus/pkg/api/domain/perm"
)
func init() {
	perm.SetUpForTest("../perm")
}
func TestCheckPermission(t *testing.T) {
	assert.Equal(t, false, CheckPermission("1", Permission{"zone-1", "manage-all-things", "department-1"}), "Permission check of account")
	perm.AddGroup("1","role-1")
	assert.Equal(t, true, CheckPermission("1", Permission{"zone-1", "manage-all-things", "department-1"}), "Permission check of account")

}

func TestOverwritePermissions(t *testing.T) {
	// simulate previously roles
	perm.AddGroup("1","role-1")
	// simulate new roles
	var newRoles  [][]string
	newRoles = append(newRoles,[]string{"1","role-2"})
	newRoles = append(newRoles,[]string{"1","role-3"})
	OverwritePermissions("1",newRoles)
	assert.Equal(t, true, CheckPermission("1", Permission{"zone-1", "see-report", "department-1"}), "Permission check of account")
	assert.Equal(t, true, CheckPermission("1", Permission{"zone-3", "*", "department-4"}), "Permission check of account")
	assert.Equal(t, false, CheckPermission("1", Permission{"zone-1", "manage-all-things", "department-1"}), "Permission check of account")
}
