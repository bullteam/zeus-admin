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
