package role

import (
	"zeus/pkg/api/domain/perm"
)

// CheckPerm : check permission by role with domain
func CheckPerm(roleName, zone, action, domain string) (bool, error) {
	return perm.Enforce(roleName, zone, action, domain)
}

// DeletePermWithDomain : clear role permission with domain
func DeletePermWithDomain(roleName, domain string) {
	perm.DelRoleByDomain(roleName, domain)
}

// DeletePerm : delete role in casbin policies
func DeletePerm(roleName string) {
	perm.DelRole(roleName)
}

// DeletePermPolicy : delete role in casbin policies
func DeletePermPolicy(roleName string) {
	perm.DeleteRolePolicy(roleName)
}

// OverwritePerm : overwrite permissions
// remove or create policy
func OverwritePerm(roleName, domainCode string, polices [][]string) {
	currentPerms := perm.GetAllPermsByRoleDomain(roleName, domainCode)
	for k1, newPerm := range polices {
		for k2, currentPerm := range currentPerms {
			if newPerm[0] == currentPerm[0] &&
				newPerm[1] == currentPerm[1] &&
				newPerm[2] == currentPerm[2] &&
				newPerm[3] == currentPerm[3] {
				polices[k1] = []string{"-skip"}
				currentPerms[k2] = []string{"-skip"}
			}
		}
	}
	for _, newPerm := range polices {
		if newPerm[0] == "-skip" {
			continue
		}
		perm.AddPerm(newPerm)
	}
	for _, remPerm := range currentPerms {
		if remPerm[0] == "-skip" {
			continue
		}
		perm.DelPerm(remPerm)
	}
}
