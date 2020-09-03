<?php

namespace ZeusClient\Auth;

class PermCenter
{
    /**
     * 验证jwt所需的公钥
     **/
    const JWTPUBLICKEY = "-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC/TYKuXsgYdoICfEZOiy1L12Cb
yPdudhrCjrjwVcIrhGNn6Udq/SY5rh0ixm09I2tXPWLYuA1R55kyeo5RPFX+FrD+
mQwfJkV/QfhaPsNjU4nCEHFMtrsYCcLYJs9uX0tJdAtE6sg/VSulg1aMqCNWvtVt
jrrVXSbu4zbyWzVkxQIDAQAB
-----END PUBLIC KEY-----";

    /**
     * 权限接口地址
     **/
    const CENTERSERVICE = "http://api.admin.bullteam.cn";
    const API_PERM_LIST = 'user/perm/list';
    const API_PERM_CHECK = 'user/perm/check';

    private $accessToken;
    private $domain;

    public function __construct($accessToken, $domain)
    {
        $this->accessToken = $accessToken;
        $this->domain      = $domain;
    }

    /**
     * 检查权限
     */
    public function checkPerm($perm)
    {
        $perm = $this->request(self::API_PERM_CHECK, [
            "domain" => $this->domain,
            "perm"   => $perm
        ], "POST");
        $perm = json_decode($perm, true);

        return $perm["code"] === 0;
    }

    /**
     * 获取用户权限列表（包括功能权限和数据权限）
     * 各自业务实现时，可缓存起来，减少网络io
     * @return array
     */
    public function getUserPerms()
    {
        $res = $this->request(self::API_PERM_LIST, [
            "domain" => $this->domain
        ], "GET");
        $res = json_decode($res, true);

        return $res['data'] ?? [];
    }

    /**
     * @param        $service
     * @param array  $params
     * @param string $method
     *
     * @return bool|string
     */
    private function request($service, $params = [], $method = "GET")
    {
        $url = self::CENTERSERVICE . "/" . $service;
        if ($method == 'GET' && count($params) > 0){
            $tmpParam = '';
            foreach ($params as $key => $param){
                $tmpParam .= $key . '=' . $param . "&";
            }
            $url .= "?" . rtrim($tmpParam, "&");
        }
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        if (!in_array($method, ["POST", "GET"], true)){
            curl_setopt($ch, CURLOPT_CUSTOMREQUEST, $method);
        }
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Authorization: Bearer ' . $this->accessToken));
        if (count($params) > 0 && $method == "POST"){
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $params);
        }
        $content = curl_exec($ch);
        curl_close($ch);

        return $content;
    }

    /**
     * 验证jwt
     * @return mixed|null
     * @throws \Exception
     */
    public function verify()
    {
        try{
            $claims = JWToken::decode($this->accessToken, self::JWTPUBLICKEY, 'RS256');
            if ($claims->exp < time()){
                throw new \Exception('登陆过期', 1001);
            }

            return $claims;
        } catch (\Exception $e) {
            throw new \Exception('校验出错', 1002);
        }
    }
}