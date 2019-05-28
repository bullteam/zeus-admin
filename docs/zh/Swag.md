# 如何使用SWaggo 开发

## 安装SWAG

```
$ go get -u github.com/swaggo/swag/cmd/swag
```
国内网络如果无法安装，请使用代理。
```
export GOPROXY=https://goproxy.io
```
若 `$GOPATH/bin` 没有加入`$PATH`中，你需要执行将其可执行文件移动到`$GOBIN`下

```
mv $GOPATH/bin/swag /usr/local/go/bin
```

## 验证是否安装成功

```
$ swag -v
swag version v1.1.1
```

## 生成

```
swag init
```
```
[root@go-dev zeus-admin]# /root/go/bin/swag init
2019/05/28 00:21:53 Generate swagger docs....
2019/05/28 00:21:53 Generate general API Info
2019/05/28 00:21:53 create docs.go at  docs/docs.go
2019/05/28 00:21:53 create swagger.json at  docs/swagger.json
2019/05/28 00:21:53 create swagger.yaml at  docs/swagger.yaml
```
完毕后会在项目根目录下生成`docs`
```
docs/
├── docs.go
└── swagger
    ├── swagger.json
    └── swagger.yaml
```
我们可以检查 `docs.go` 文件中的 `doc` 变量，详细记载中我们文件中所编写的注解和说明

## 验证访问

```
http://127.0.0.1/swagger/index.html

```