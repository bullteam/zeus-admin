package perm

import (
	rediswatcher "github.com/billcobbler/casbin-redis-watcher"
	"github.com/casbin/casbin"
	"github.com/spf13/viper"
	"zeus/pkg/api/domain/perm/adapter"
	"zeus/pkg/api/log"
)

var (
	enforcer *casbin.Enforcer
)

// SetUp permission handler
func SetUp() {
	enforcer = casbin.NewEnforcer(viper.GetString("casbin.model.rule_0"), adapter.NewMysqlAdapter())
	//Distributed watcher
	w, _ := rediswatcher.NewWatcher(viper.GetString("redis.host"), rediswatcher.Password(viper.GetString("redis.auth")))
	enforcer.SetWatcher(w)
	// @Overwrite
	// See if policy changed and do distributed notification
	_ = w.SetUpdateCallback(func(s string) {
		log.Info("Casbin policies changed")
		_ = enforcer.LoadPolicy()
	})
}

// SetUpForTest : for unit tests
func SetUpForTest(dir string) {
	enforcer = casbin.NewEnforcer(dir+"/rbac_model_0.conf", dir+"/perm_test.csv")
}

// AddGroup : method for group policy adding
//first : user
//second : group
func AddGroup(params ...interface{}) bool {
	return enforcer.AddGroupingPolicy(params...)
}

// AddPerm : method for permission policy adding
//sub,obj,act,domain
func AddPerm(params ...interface{}) bool {
	return enforcer.AddPolicy(params...)
}

// DelPerm : delete permission policy
func DelPerm(params ...interface{}) bool {
	return enforcer.RemovePolicy(params...)
}

// Enforce : check permission
func Enforce(params ...interface{}) bool {
	return enforcer.Enforce(params...)
}

// DelRoleByName : delete all specific role policy of domain
func DelRoleByDomain(role string, domain string) {
	enforcer.RemoveFilteredNamedPolicy("p", 0, role, "", "", domain)
}

// DelRole : delete specific role
func DelRole(role string) {
	enforcer.RemoveFilteredNamedPolicy("p", 0, role)
}

// GetAllPermsByRoleDomain : get policies by role and domain
func GetAllPermsByRoleDomain(role string, domain string) [][]string {
	roles := enforcer.GetFilteredNamedPolicy("p", 0, role, "", "", domain)
	return roles
}

// GetAllPermsByRole : get all permission across domains
func GetAllPermsByRole(role string) [][]string {
	roles := enforcer.GetFilteredNamedPolicy("p", 0, role, "", "", "")
	return roles
}

//dangerous! do not call until you really need it
func CommitChange() {
	enforcer.SavePolicy()
}
