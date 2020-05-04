# zeusclient-java
Zeus client Java客户端

```
    //校验是否有权限
    PermCenter permCenter = new PermCenter(accessToken, CENTER_SERVICE);
    try{
        Map<String, Claim> userInfo = permCenter.verify();
        if (userInfo == null) {
            throw new IllegalArgumentException("用户不存在");
        }
    
        System.out.println(userInfo.get("uid").asString());
        System.out.println(userInfo.get("exp").asLong());
        System.out.println(userInfo.get("uname").asString());
    }catch(JWTVerificationException e){
        //校验出错
    }
    
    if (!permCenter.checkPerm(url)) {
        //没有权限
    }
```