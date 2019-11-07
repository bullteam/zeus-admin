#!/bin/bash

function SysTem() {
a=`uname  -a`

if [[ $a =~ "Darwin" ]];then
    os_name="darwin"
elif [[ $a =~ "MINGW" || $a =~ "MSYS" ]];then
    os_name="windows"
else
    os_name="linux"
fi
}

SysTem
echo "当前操作系统:"${os_name}

export GO111MODULE=on
export GOPROXY=https://goproxy.io

#SetEnv
bash_dir=`pwd`
release_dir=./build/release
config_dir=./config
dist_dir=./pkg/webui/dist
scripts_dir=./scripts
doc_dir=./docs

upx=${bash_dir}/scripts/upx/${os_name}/upx
echo ${upx}

DATE=`date +%Y-%m-%d-%H%M%S`
echo $DATE

rm -rf ${release_dir}
mkdir -p ${release_dir}

echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>进入项目目录<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
cd  ${bash_dir}

echo "开始编译···"
GOOS=linux GOARCH=amd64 go build -o ${release_dir}/linux-$DATE -ldflags "-s -w"
GOOS=windows GOARCH=amd64 go build -o ${release_dir}/windows-$DATE -ldflags "-s -w"
GOOS=darwin GOARCH=amd64 go build -o ${release_dir}/darwin-$DATE -ldflags "-s -w"

echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>生成swagger文档<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
echo "开始生成新swagger文档"
swag init
#todo bug swag生成文档错误


echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>编译前端项目<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"

cd  ${bash_dir}/${dist_dir}/../
echo "生成前端打包文件"
yarn install
yarn run build:work


echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>复制项目文件<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"

#复制配置文件,前端打包文件,swag文档等
cd  ${bash_dir}/${release_dir}

echo "复制配置文件"
cp -rf ${bash_dir}/${config_dir} ./

echo "复制运行脚本"
cp -rf ${bash_dir}/${scripts_dir}/run.sh ./

echo "复制sql脚本"
cp -rf ${bash_dir}/${scripts_dir}/init.sql ./

echo "复制API文档"
cp -rf  ${bash_dir}/${doc_dir} ./

echo "复制前端打包文件"
mkdir -p ${dist_dir}
cd ${dist_dir}/../
cp -rf  ${bash_dir}/${dist_dir} ./


#压缩优化
#工具安装：从 github.com/upx/upx 下载upx安装文件
echo "压制执行文件···"
cd  ${bash_dir}/${release_dir}
${upx} --brute linux-${DATE}
${upx} --brute windows-${DATE}
${upx} --brute darwin-${DATE}
echo "压制完成"

#打包文件
echo "创建压缩包"
cd  ${bash_dir}/${release_dir}
tar -cf ./server.$DATE.tar.gz .

cd  ${bash_dir}

