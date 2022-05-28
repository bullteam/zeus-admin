package perm

import (
	rediswatcher "github.com/billcobbler/casbin-redis-watcher/v2"
	"github.com/casbin/casbin/v2"
	"github.com/spf13/viper"
	"sync"
	"zeus/pkg/api/domain/perm/adapter"
	"zeus/pkg/api/log"
)

var (
	enforcer     *casbin.Enforcer
	enforcerLock = &sync.Mutex{}
)

// SetUp permission handler
func SetUp(cluster bool) {
	enforcer, _ = casbin.NewEnforcer(viper.GetString("casbin.model.rule_0"), adapter.NewMysqlAdapter())
	if cluster {
		//Distributed watcher
		w, _ := rediswatcher.NewWatcher(viper.GetString("redis.host"), rediswatcher.Password(viper.GetString("redis.auth")))

		err := enforcer.SetWatcher(w)
		if err != nil {
			return
		}
		// @Overwrite
		// See if policy changed and do distribute notification
		_ = w.SetUpdateCallback(func(s string) {
			log.Info("Casbin policies changed")
			enforcerLock.Lock()
			_ = enforcer.LoadPolicy()
			enforcerLock.Unlock()
		})
	}
}

// SetUpForTest : for unit tests
func SetUpForTest(dir string) {
	enforcer, _ = casbin.NewEnforcer(dir+"/rbac_model_0.conf", dir+"/perm_test.csv")
}

// AddGroup : method of group policy adding
//first : user
//second : group
func AddGroup(params ...interface{}) (bool, error) {
	enforcerLock.Lock()
	defer enforcerLock.Unlock()
	return enforcer.AddGroupingPolicy(params...)
}

// AddGroupRole : assign role to a user group
func AddGroupRole(params ...interface{}) (bool, error) {
	enforcerLock.Lock()
	defer enforcerLock.Unlock()
	return enforcer.AddNamedGroupingPolicy("g2", params...)
}

// DelGroup : method of group policy deleting
func DelGroup(params ...interface{}) (bool, error) {
	enforcerLock.Lock()
	defer enforcerLock.Unlock()
	return enforcer.RemoveGroupingPolicy(params...)
}

// DelGroupPerm : delete user group - role connection
func DelGroupPerm(params ...interface{}) (bool, error) {
	enforcerLock.Lock()
	defer enforcerLock.Unlock()
	return enforcer.RemoveNamedGroupingPolicy("g2", params...)
}

// GetGroupsByUser : get groups by specific user
func GetGroupsByUser(userId string) [][]string {
	return enforcer.GetFilteredGroupingPolicy(0, userId)
}

// AddPerm : method for permission policy adding
//sub,obj,act,domain
func AddPerm(params ...interface{}) (bool, error) {
	enforcerLock.Lock()
	defer enforcerLock.Unlock()
	return enforcer.AddPolicy(params...)
}

// DelPerm : delete permission policy
func DelPerm(params ...interface{}) (bool, error) {
	enforcerLock.Lock()
	defer enforcerLock.Unlock()
	return enforcer.RemovePolicy(params...)
}

// DelFilteredPerm : del filter perm
func DelFilteredPerm(fieldIndex int, params ...string) (bool, error) {
	enforcerLock.Lock()
	defer enforcerLock.Unlock()
	return enforcer.RemoveFilteredPolicy(fieldIndex, params...)
}

// Enforce : check permission
func Enforce(params ...interface{}) (bool, error) {
	enforcerLock.Lock()
	defer enforcerLock.Unlock()
	return enforcer.Enforce(params...)
}

// DelRoleByDomain  : delete all specific role policy of domain
func DelRoleByDomain(role string, domain string) {
	DelFilteredPerm(0, role, "", "", domain)
}

// DelRole : delete specific role
func DelRole(role string) {
	DelFilteredPerm(0, role)
	enforcer.RemoveFilteredGroupingPolicy(1, role)
}

// DeleteRolePolicy : delete policy row
func DeleteRolePolicy(role string) {
	DelFilteredPerm(0, role)
}

// GetAllPermsByRoleDomain : get policies by role and domain
func GetAllPermsByRoleDomain(role string, domain string) [][]string {
	perms := enforcer.GetFilteredNamedPolicy("p", 0, role, "", "", domain)
	return perms
}

// GetAllPermsByRole : get all permission across domains
func GetAllPermsByRole(role string) [][]string {
	perms := enforcer.GetFilteredNamedPolicy("p", 0, role, "", "", "")
	return perms
}

// GetAllPermsByUser : get all permission across domains
func GetAllPermsByUser(uid string) [][]string {
	perms := enforcer.GetFilteredNamedGroupingPolicy("g", 0, uid, "", "", "")
	var policies [][]string
	for _, policy := range perms {
		rp := GetAllPermsByRole(policy[1])
		policies = append(policies, rp...)
	}
	return policies
}

// CommitChange dangerous! do not call until you really need it
func CommitChange() {
	_ = enforcer.SavePolicy()
}
