package utils

import (
	"math/rand"
	"reflect"
	"time"
)
const charset = "abcdefghijklmnopqrstuvwxyz" +
	"ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789" +
	"@#$%^&*(~)"

var seededRand = rand.New(
	rand.NewSource(time.Now().UnixNano()))

func StringWithCharset(length int, charset string) string {
	b := make([]byte, length)
	for i := range b {
		b[i] = charset[seededRand.Intn(len(charset))]
	}
	return string(b)
}

func RandomPwd(length int) string {
	return StringWithCharset(length, charset)
}
func StringSliceRemove(s [][]string, i int) [][]string {
	s[i] = s[len(s)-1]
	return s[:len(s)-1]
}
func IsNilObject(object interface{}) bool {
	if object == nil {
		return true
	}

	value := reflect.ValueOf(object)
	kind := value.Kind()
	if kind >= reflect.Chan && kind <= reflect.Slice && value.IsNil() {
		return true
	}

	return false
}
