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
	// See if policy changed and do distributed notification
	_ = w.SetUpdateCallback(func(s string) {
		log.Info("Casbin policies changed")
		_ = enforcer.LoadPolicy()
	})
}

//first : user
//second : group
func AddGroup(params ...interface{}) bool {
	return enforcer.AddGroupingPolicy(params...)
}

//sub,obj,act,domain
func AddPerm(params ...interface{}) bool {
	return enforcer.AddPolicy(params...)
}

func DelPerm(params ...interface{}) bool {
	return enforcer.RemovePolicy(params...)
}

func Check(params ...interface{}) bool {
	return enforcer.Enforce(params...)
}

func DeleteRoleByDomain(role string, domain string) {
	enforcer.RemoveFilteredNamedPolicy("p", 0, role, "", "", domain)
}

func DeleteRole(role string) {
	enforcer.RemoveFilteredNamedPolicy("p", 0, role)
}

// 通过角色和域获取权限列表 并载入到内存
func GetAllPermByRole(role string, domain string) [][]string {
	enforcer.LoadPolicy()
	roles := enforcer.GetFilteredNamedPolicy("p", 0, role, "", "", domain)
	return roles
}

// 通过角色和域获取权限列表 不载入内存
func GetAllPermByRoleName(role string, domain string) [][]string {
	roles := enforcer.GetFilteredNamedPolicy("p", 0, role, "", "", domain)
	return roles
}

//dangerous! do not call until you really need it
func CommitChange() {
	enforcer.SavePolicy()
}
