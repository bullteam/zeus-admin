package account

import (
	"crypto/rand"
	"fmt"
	"golang.org/x/crypto/scrypt"
	"io"
	"zeus/pkg/api/domain/perm"
	"zeus/pkg/api/model"
)

const pwHashBytes = 64

// Permission : where ,do what ,in which domain
type Permission struct {
	Zone   string
	Action string
	Domain string
}

// VerifyPassword : verify password by salt
func VerifyPassword(password string, userModel model.User) bool {
	if pwd, err := HashPassword(password, userModel.Salt); err == nil && pwd == userModel.Password {
		return true
	}
	return false
}

// HashPassword : password hashing
func HashPassword(password string, salt string) (hash string, err error) {
	h, err := scrypt.Key([]byte(password), []byte(salt), 16384, 8, 1, pwHashBytes)
	if err != nil {
		return "", err
	}
	return fmt.Sprintf("%x", h), nil
}

// MakeSalt : make password more complicated
func MakeSalt() (salt string, err error) {
	buf := make([]byte, pwHashBytes)
	if _, err := io.ReadFull(rand.Reader, buf); err != nil {
		return "", err
	}
	return fmt.Sprintf("%x", buf), nil
}

// CheckPermission : check permission in all roles of account
func CheckPermission(roles []model.Role, p Permission) bool {
	for _, r := range roles {
		if perm.Enforce(r.RoleName, p.Zone, p.Action, p.Domain) {
			return true
		}
	}
	return false
}
