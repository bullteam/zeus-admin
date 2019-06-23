package perm

import (
	"github.com/casbin/casbin"
	"github.com/stretchr/testify/assert"
	"testing"
)
type permissionCases struct {
	args []interface{}
	want bool
	label string
}
var pcases = []permissionCases{
	{
		args: []interface{}{"role-1","zone-1","manage-all-things","department-1"},
		want: true,
		label:"Check with defined policy",
	},
	{
		args:[]interface{}{"role-1","zone-1","action-not-defined","department-1"},
		want:false,
		label:"Check with undefined policy",
	},
	{
		args:[]interface{}{"role-1","zone-1","manage-all-things","department-not-defined"},
		want:false,
		label:"Check with undefined policy",
	},
}
func init() {
	enforcer = casbin.NewEnforcer("./rbac_model_0.conf","./perm_test.csv")
}
func runTestCases(t *testing.T,pcase []permissionCases){
	for _,cs := range pcases{
		assert.Equal(t,cs.want,Check(cs.args...),cs.label)
	}
}
func TestGetAllPermByRoleName(t *testing.T) {
	perms := GetAllPermByRole("role-1","department-1")
	assert.Equal(t,2,len(perms),"Got 2 polices with role1 in department-1")
	assert.Equal(t,"role-1",perms[0][0],"Match in results")
}
func TestCheck(t *testing.T) {
	runTestCases(t,pcases)
}
func TestAddGroup(t *testing.T) {
	AddGroup("lake","role-1")
	ps := append(pcases,permissionCases{
		args:  []interface{}{"lake", "zone-1", "manage-all-things", "department-1"},
		want:  true,
		label: "Check with defined policy",
	})
	ps = append(ps,permissionCases{
		args:  []interface{}{"lake", "zone-1", "action-not-defined", "department-1"},
		want:  false,
		label: "Check with undefined policy",
	})
	runTestCases(t,ps)
}

func TestAddPerm(t *testing.T) {
	AddPerm("role-4","zone-1","action-1","department-1")
	ps := append(pcases,permissionCases{
		args:  []interface{}{"role-4","zone-1","action-1","department-1"},
		want:  true,
		label: "Check with defined policy - from AddPerm",
	})
	runTestCases(t,ps)
}

func TestDelPerm(t *testing.T) {
	DelPerm("role-1","zone-2","manage-some-stuff","department-1")
	runTestCases(t,[]permissionCases{
		{
			args:  []interface{}{"role-1","zone-2","manage-some-stuff","department-1"},
			want:  false,
			label: "Check with undefined policy - from DelPerm",
		},
	})
}
