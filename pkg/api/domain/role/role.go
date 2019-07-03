package role

import (
	"zeus/pkg/api/domain/perm"
	"zeus/pkg/api/utils"
)

// CheckPerm : check permission by role with domain
func CheckPerm(roleName, zone, action, domain string) bool {
	return perm.Enforce(roleName, zone, action, domain)
}

// ClearPerm : clear role permission with domain
func ClearPerm(roleName, domain string) {
	perm.DelRoleByDomain(roleName, domain)
}

// OverwritePerm : overwrite permissions
// remove or create policy
func OverwritePerm(roleName ,domainCode string, polices [][]string) {
	currentPerms := perm.GetAllPermsByRoleDomain(roleName,domainCode)
	for k1, newPerm := range polices {
		for k2, currentPerm := range currentPerms {
			if newPerm[0] == currentPerm[0] &&
				newPerm[1] == currentPerm[1] &&
				newPerm[2] == currentPerm[2] &&
				newPerm[3] == currentPerm[3] {
				utils.StringSliceRemove(polices, k1)
				utils.StringSliceRemove(currentPerms, k2)
			}
		}
	}
	for _, new := range polices {
		perm.AddPerm(new)
	}
	for _, rem := range currentPerms {
		perm.DelPerm(rem)
	}
}
