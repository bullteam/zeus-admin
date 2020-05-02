#Zeusclient-go  宙斯后台权限系统golang客户端


```
import "ZeusSdk"
var (
	ZeusService = ZeusSdkService{}
)
func main(){
    tokenStr := "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1ODg0Mjc5MTksImlkIjoyLCJuYW1lIjoiYWRtaW4iLCJvcmlnX2lhdCI6MTU4ODM0MTUxOSwidWlkIjoyLCJ1bmFtZSI6ImFkbWluIn0.A15i8yx8R3p386_1Li124StTyRkw24lREPHmDsq6uR_fJCReKLaOU3--66xuUyG285ZcAZiz3a8P-Dv0sj6H3j2mgi5pnOFrXWwJX51OWeDvOCoKajyDtvwp-FZxa33XOajzWe2F9Z4IIMY5CK8ljK5slg9bkIU8F0oT_IPEyIo"
    //校验token是否过期
    VerifyTokenRes := ZeusService.VerifyToken(tokenStr)
    if VerifyTokenRes != nil {
        // 抛错处理
    }
    checkPermRes := ZeusService.checkPerm($urlStr)
    if checkPermRes != nil {
        //没有权限
     }
}
```