package ZeusSdk

import (
	"fmt"
	"github.com/stretchr/testify/assert"
	"testing"
)

const tokenStr = "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1ODg0Mjc5MTksImlkIjoyLCJuYW1lIjoiYWRtaW4iLCJvcmlnX2lhdCI6MTU4ODM0MTUxOSwidWlkIjoyLCJ1bmFtZSI6ImFkbWluIn0.A15i8yx8R3p386_1Li124StTyRkw24lREPHmDsq6uR_fJCReKLaOU3--66xuUyG285ZcAZiz3a8P-Dv0sj6H3j2mgi5pnOFrXWwJX51OWeDvOCoKajyDtvwp-FZxa33XOajzWe2F9Z4IIMY5CK8ljK5slg9bkIU8F0oT_IPEyIo"

var (
	err         error
	ZeusService = ZeusSdkService{}
)

func TestCheckPerm(t *testing.T) {
	str, _ := ZeusService.CheckPerm(tokenStr, "zeus-config", "/configlist/list")
	fmt.Print(str)
	assert.Equal(t, nil, err)
}
func TestGetUserPerms(t *testing.T) {
	str, _ := ZeusService.GetUserPerms(tokenStr, "zeus-config")
	fmt.Print(str)
	assert.Equal(t, nil, err)
}
func TestVerify(t *testing.T) {
	str := ZeusService.VerifyToken(tokenStr)
	fmt.Print(str)
	assert.Equal(t, nil, err)
}

func TestGetUserInfo(t *testing.T) {
	_, str := ZeusService.GetUserInfo(tokenStr)
	fmt.Print(str)
	assert.Equal(t, nil, err)
}
