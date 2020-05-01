package ZeusSdk

import (
	"errors"
	"fmt"
	"github.com/dgrijalva/jwt-go"
	"io/ioutil"
	"net/http"
	"strings"
	"time"
)

/**
 * 权限接口地址
 **/
const CENTERSERVICE = "http://api.admin.bullteam.cn"
const API_PERM_LIST = "user/perm/list"
const API_PERM_CHECK = "user/perm/check"
var (
	publicKey []byte
)
type UserClaims struct {
	Id   int    `json:"id"`
	Name string `json:"name"`
}

type CustomClaims struct {
	User *UserClaims `json:"user"`
	jwt.StandardClaims
}

func init()  {
	publicKey, _ = ioutil.ReadFile("./pub_key.pub")
}

func CheckPerm(tokenStr string) ([]byte, error) {
	url := CENTERSERVICE + API_PERM_LIST
	client := &http.Client{}
	req, err := http.NewRequest("POST", url, strings.NewReader("name=cjb"))
	if err != nil {
		//return nil, errors.New("post error")
	}
	req.Header.Set("Content-Type", "application/x-www-form-urlencoded")
	req.Header.Set("Authorization", "Bearer "+string(tokenStr))
	resp, err := client.Do(req)
	defer resp.Body.Close()
	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		//return ""
	}
	return body, nil
}

/**
 * 获取用户权限列表（包括功能权限和数据权限）
 * 各自业务实现时，可缓存起来，减少网络io
 */
func GetUserPerms(tokenStr string) {
	url := CENTERSERVICE + API_PERM_CHECK
	resp, err :=   http.Get(url)
	if err != nil {
		// handle error
	}
	defer resp.Body.Close()
	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		// handle error
	}
	fmt.Println(string(body))
}

/**
 * 验证jwt
 */
func VerifyToken(tokenStr string) error {
	fmt.Println(publicKey)
	var myClaims CustomClaims
	token, err := jwt.ParseWithClaims(tokenStr, &myClaims, func(token *jwt.Token) (interface{}, error) {
		return publicKey, nil
	})
	if err != nil {
		fmt.Println("err !!!!")
		return err
	}
	claims, ok := token.Claims.(jwt.MapClaims)
	if ok && token.Valid {
		if !claims.VerifyExpiresAt(time.Now().Unix(), true) {
			return errors.New("VerifyExpiresAt")
		}
	}
	return nil
}
