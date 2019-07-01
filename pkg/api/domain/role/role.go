package role

import "zeus/pkg/api/domain/perm"

// CheckPerm : check permission by role with domain
func CheckPerm(roleName string, zone string, action string, domain string) bool {
	return perm.Enforce(roleName, zone, action, domain)
}

// ClearPerm : clear role permission with domain
func ClearPerm(roleName string,domain string) {
	perm.DelRoleByDomain(roleName,domain)
}