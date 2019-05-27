# 生成公钥和密钥
1. 打开终端`Terminal`或者`iTerm`输入以下命令生成私钥:

 ```
openssl genrsa -out rsa_private_key.pem 1024
 ```
2. 把`RSA`私钥转换成`PKCS8`格式
   
```
openssl pkcs8 -topk8 -inform PEM -in rsa_private_key.pem -outform PEM -nocrypt

```
注意把控制台输出的私钥内容替换到私钥文件(`rsa_private_key.pem`)中去。

3. 生成公钥
   
```
openssl rsa -in rsa_private_key.pem -out rsa_public_key.pem -pubout

```
4. 将生成的 `rsa_private_key.pem`,`rsa_public_key.pem` 替换 `cmd/api-server/keys`
   