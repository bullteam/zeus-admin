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
	check1, _ := CheckPermission("1", Permission{"zone-1", "manage-all-things", "department-1"})
	assert.Equal(t, false, check1, "Permission check of account")
	perm.AddGroup("1", "role-1")
	check2, _ := CheckPermission("1", Permission{"zone-1", "manage-all-things", "department-1"})
	assert.Equal(t, true, check2, "Permission check of account")
}

func TestOverwriteRoles(t *testing.T) {
	// simulate previously roles
	perm.AddGroup("2", "role-1")
	// simulate new roles
	var newRoles [][]string
	newRoles = append(newRoles, []string{"2", "role-2"})
	newRoles = append(newRoles, []string{"2", "role-3"})
	OverwriteRoles("2", newRoles)
	check1, _ := CheckPermission("2", Permission{"zone-1", "see-report", "department-1"})
	check2, _ := CheckPermission("2", Permission{"zone-3", "*", "department-4"})
	check3, _ := CheckPermission("2", Permission{"zone-1", "manage-all-things", "department-1"})
	assert.Equal(t, true, check1, "Permission check of account")
	assert.Equal(t, true, check2, "Permission check of account")
	assert.Equal(t, false, check3, "Permission check of account")
}

func TestDeleteUser(t *testing.T) {
	perm.AddGroup("lake", "role-1")
	perm.AddGroup("lake", "role-3")
	check1, _ := CheckPermission("lake", Permission{"zone-2", "manage-some-stuff", "department-1"})
	check2, _ := CheckPermission("lake", Permission{"zone-3", "*", "department-4"})
	assert.Equal(t, true, check1, "Permission check of account")
	assert.Equal(t, true, check2, "Permission check of account")
	assert.Len(t, perm.GetGroupsByUser("lake"), 2, "Verify - user's deletion")
	DeleteUser("lake")
	assert.Len(t, perm.GetGroupsByUser("lake"), 0, "verify user's deletion")
}
