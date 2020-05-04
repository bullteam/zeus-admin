package cn.bullteam;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.auth0.jwt.interfaces.Claim;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.auth0.jwt.interfaces.JWTVerifier;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PermCenter {
    /**
     * 验证jwt所需的公钥
     **/
    public static final String JWT_PUBLIC_KEY = "-----BEGIN PUBLIC KEY-----\n" +
            "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC/TYKuXsgYdoICfEZOiy1L12Cb\n" +
            "yPdudhrCjrjwVcIrhGNn6Udq/SY5rh0ixm09I2tXPWLYuA1R55kyeo5RPFX+FrD+\n" +
            "mQwfJkV/QfhaPsNjU4nCEHFMtrsYCcLYJs9uX0tJdAtE6sg/VSulg1aMqCNWvtVt\n" +
            "jrrVXSbu4zbyWzVkxQIDAQAB\n" +
            "-----END PUBLIC KEY-----";


    /**
     * 权限接口地址
     **/
    public static final String CENTER_SERVICE = "http://api.admin.bullteam.cn";

    private String accessToken;

    private String domain;

    public PermCenter(String accessToken, String domain) {
        this.accessToken = accessToken;
        this.domain = domain;
    }


    /**
     * 检查权限
     */
    public boolean checkPerm(String perm) throws IOException {
        Map<String,String> params = new HashMap<>();
        params.put("perm", perm);
        return "0".equals(this.request("/user/perm/check", params).getString("code"));

    }


    private JSONObject request(String url, Map<String, String> params) throws IOException {

        HttpClient client = HttpClientBuilder.create().build();
        HttpPost post = new HttpPost(this.domain + url);

        // add header
        post.setHeader("Authorization", "Bearer " + accessToken);

        List<NameValuePair> urlParameters = new ArrayList<NameValuePair>();
        for (Map.Entry<String, String> entry : params.entrySet()) {
            urlParameters.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
        }

        post.setEntity(new UrlEncodedFormEntity(urlParameters));

        HttpResponse response = client.execute(post);
        System.out.println("Response Code : "
                + response.getStatusLine().getStatusCode());

        BufferedReader rd = new BufferedReader(
                new InputStreamReader(response.getEntity().getContent()));

        StringBuilder result = new StringBuilder();
        String line = "";
        while ((line = rd.readLine()) != null) {
            result.append(line);
        }
        System.out.println("Response Body :" + result.toString());
        return JSON.parseObject(result.toString());
    }

    /**
     * 验证
     */
    public Map<String, Claim> verify() throws JWTVerificationException {
        DecodedJWT jwt = JWT.decode(this.accessToken);
        return jwt.getClaims();
    }
}
