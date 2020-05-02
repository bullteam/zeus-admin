#Zeusclient-php  宙斯后台权限系统PHP客户端

##composer.json配置
增加如下配置
````
{
  "require": {
    "zeusclient-php": "^0.1"
  },
    "zeusclient-php": {
      "type": "git",
      "url": "git@github.com:bullteam/zeusclient-php.git"
    }
  }
}

````
如下代码可以增加在Php MVC框架中的controller 父类中
````
use  ZeusClient\Auth\PermCenter

//校验是否有权限
 $perm = new PermCenter($accessToken, 'moto-admin');
try{
      $userInfo = $perm->verify();
      if ($userInfo == null) {
           throw new \Exception("");
       }
   }catch(\Exception $e){
        if ($e->getCode() == 1001){
                //登陆过期
         }else{
               //校验出错
         }
            //抛出异常
  }
  echo  $userInfo->uid;//用户ID
  echo  $userInfo->uname;//用户名称
  if (!$perm->checkPerm($urlStr)) {
           //没有权限
  }
````