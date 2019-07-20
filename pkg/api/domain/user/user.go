package user

import (
	"zeus/pkg/api/domain/perm"
)

// Permission : where ,do what ,in which domain
type Permission struct {
	Zone   string
	Action string
	Domain string
}

// CheckPermission : check permission in all roles of account
func CheckPermission(userId string, p Permission) bool {
	return perm.Enforce(userId, p.Zone, p.Action, p.Domain)
}

// OverwriteRoles : assign roles to specific user
func OverwriteRoles(userId string, newRoles [][]string) {
	currentRoles := perm.GetGroupsByUser(userId)
	for k1, newRole := range newRoles {
		for k2, currentRole := range currentRoles {
			if newRole[0] == currentRole[0] && newRole[1] == currentRole[1] {
				//utils.StringSliceRemove(newRoles, k1)
				//utils.StringSliceRemove(currentRoles, k2)
				newRoles[k1] = []string{"-skip"}
				currentRoles[k2] = []string{"-skip"}
			}
		}
	}
	for _, newRole := range newRoles {
		if newRole[0] == "-skip" {
			continue
		}
		perm.AddGroup(newRole)
	}
	for _, rmRole := range currentRoles {
		if rmRole[0] == "-skip" {
			continue
		}
		perm.DelGroup(rmRole)
	}
}

// Delete user's group policies
func DeleteUser(uid string) {
	groups := perm.GetGroupsByUser(uid)
	for _, group := range groups {
		perm.DelGroup(group)
	}
}
