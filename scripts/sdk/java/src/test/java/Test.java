import cn.bullteam.PermCenter;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.auth0.jwt.interfaces.Claim;

import java.io.IOException;
import java.util.Map;

import static cn.bullteam.PermCenter.CENTER_SERVICE;

public class Test {
    public static void main(String[] args) throws IOException {

        String accessToken = "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiIyIiwidW5hbWUiOiJhZG1pbiIsImV4cCI6MTU1NzIzNTg1N30.rQizrl2W97bG6rhttrM9noDxn0ni1vnC6XDSDgIOanMPZAcyb47WWhB-MbGQ8Jkghmd4Ag42yNdySisXczB0zSJZr59_iXls45_VDbFm5PtkH4oU-nU8ZNlvQ-gdSnnfxYrPcAxJ6fW-B0dF1kN9_GM23NOn9Wm-PhtP3K2DlYY";
        String url ="";
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
    }
}
