#!/bin/bash

export MYSQL_USERNAME=root
export MYSQL_PASSWORD=root
export MYSQL_HOST=127.0.0.1
export MYSQL_DB=zeus
export MYSQL_PORT=3306
export REDIS_HOST=127.0.0.1
export REDIS_PORT=6379
export REDIS_PASSWORD=""


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
server_bin=`ls ${os_name}*`
echo ${server_bin}

./${server_bin} server