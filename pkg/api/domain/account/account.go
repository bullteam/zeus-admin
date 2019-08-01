package account

import (
	"crypto/rand"
	"fmt"
	"golang.org/x/crypto/scrypt"
	"io"
)

const pwHashBytes = 64

type LoginType struct {
	Type int
}

//登录类型
var (
	LoginStandard = &LoginType{1}
	LoginOAuth    = &LoginType{2}
)

//社会化登陆类型
type OAuthType struct {
	From int
}

var (
	OAuthDingTalk = &OAuthType{1}
	OAuthWechat   = &OAuthType{2}
	OAuthQQ       = &OAuthType{3}
	OAuthFacebook = &OAuthType{4}
	OAuthGoogle   = &OAuthType{5}
)

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
