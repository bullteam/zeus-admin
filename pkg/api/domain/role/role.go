package role

import "zeus/pkg/api/domain/perm"

// CheckPerm : check permission by role and domain
func CheckPerm(roleName string,where string,domain string) bool {
	return perm.Enforce(roleName,where,"*",domain)
}