package role

import (
	"github.com/stretchr/testify/assert"
	"testing"
	"zeus/pkg/api/domain/perm"
)

func init() {
	perm.SetUpForTest("../perm")
}
func TestCheckPerm(t *testing.T) {
	assert.Equal(t, true, CheckPerm("role-3", "zone-3", "*", "department-4"), "Permission check of role")
	assert.Equal(t, false, CheckPerm("role-3", "nowhere", "*", "department-4"), "Permission check of role")
}
func TestClearPerm(t *testing.T) {
	ClearPerm("role-1", "department-1")
	assert.Equal(t, false, CheckPerm("role-1", "zone-1", "manage-all-things", "department-1"), "Check clear perm")
}
func TestOverwritePerm(t *testing.T) {
	OverwritePerm("role-1", [][]string{
		{"role-1", "zone-1", "*", "department-1"},
		{"role-1", "zone-2", "manage-some-stuff", "department-1"},
	})
	assert.Equal(t, true, CheckPerm("role-1", "zone-1", "*", "department-1"), "Permission check of role after overwrite")
	assert.Equal(t, false, CheckPerm("role-1", "zone-1", "manage-all-things", "department-1"), "Permission check of role after overwrite")
	assert.Equal(t, true, CheckPerm("role-1", "zone-2", "manage-some-stuff", "department-1"), "Permission check of role after overwrite")

	//AssignPerm()
}
