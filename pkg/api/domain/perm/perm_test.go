package perm

import (
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
		label:"Enforce with defined policy",
	},
	{
		args:[]interface{}{"role-1","zone-1","action-not-defined","department-1"},
		want:false,
		label:"Enforce with undefined policy",
	},
	{
		args:[]interface{}{"role-1","zone-1","manage-all-things","department-not-defined"},
		want:false,
		label:"Enforce with undefined policy",
	},
}
func init() {
	SetUpForTest(".")
	//enforcer = casbin.NewEnforcer("./rbac_model_0.conf","./perm_test.csv")
}
func runTestCases(t *testing.T,cases []permissionCases){
	for _,cs := range cases{
		assert.Equal(t,cs.want, Enforce(cs.args...),cs.label)
	}
}
func TestGetAllPermByRoleName(t *testing.T) {
	perms := GetAllPermByRoleDomain("role-1","department-1")
	assert.Equal(t,2,len(perms),"Got 2 polices with role1 in department-1")
	assert.Equal(t,"role-1",perms[0][0],"Match in results")
}
func TestEnforce(t *testing.T) {
	runTestCases(t,pcases)
}
func TestAddGroup(t *testing.T) {
	AddGroup("lake","role-1")
	ps := append(pcases,permissionCases{
		args:  []interface{}{"lake", "zone-1", "manage-all-things", "department-1"},
		want:  true,
		label: "Enforce with defined policy",
	})
	ps = append(ps,permissionCases{
		args:  []interface{}{"lake", "zone-1", "action-not-defined", "department-1"},
		want:  false,
		label: "Enforce with undefined policy",
	})
	runTestCases(t,ps)
}

func TestAddPerm(t *testing.T) {
	AddPerm("role-4","zone-1","action-1","department-1")
	ps := append(pcases,permissionCases{
		args:  []interface{}{"role-4","zone-1","action-1","department-1"},
		want:  true,
		label: "Enforce with defined policy - from AddPerm",
	})
	runTestCases(t,ps)
}

func TestDelPerm(t *testing.T) {
	DelPerm("role-1","zone-2","manage-some-stuff","department-1")
	runTestCases(t,[]permissionCases{
		{
			args:  []interface{}{"role-1","zone-2","manage-some-stuff","department-1"},
			want:  false,
			label: "Enforce with undefined policy - from DelPerm",
		},
	})
}

func TestDelRoleByDomain(t *testing.T) {
	DelRoleByDomain("role-1","department-1")
	runTestCases(t,[]permissionCases{
		{
			args:  []interface{}{"role-1","zone-1","manage-all-things","department-1"},
			want:  false,
			label: "Enforce with undefined policy - from DelRoleByDomain",
		},
		{
			args:  []interface{}{"role-1","zone-3","can-not-do-anything","department-2"},
			want:  true,
			label: "Enforce with defined policy - from DelRoleByDomain",
		},
	})
}

func TestDelRole(t *testing.T) {
	DelRole("role-1")
	runTestCases(t,[]permissionCases{
		{
			args:  []interface{}{"role-1","zone-1","manage-all-things","department-1"},
			want:  false,
			label: "Enforce with undefined policy - from DelRole",
		},
		{
			args:  []interface{}{"role-1","zone-3","can-not-do-anything","department-2"},
			want:  false,
			label: "Enforce with defined policy - from DelRole",
		},
	})
	DelRole("role-2")
	runTestCases(t,[]permissionCases{
		{
			args:  []interface{}{"role-2","zone-1","see-report","department-1"},
			want:  false,
			label: "Enforce with undefined policy - from DelRole",
		},
	})
}