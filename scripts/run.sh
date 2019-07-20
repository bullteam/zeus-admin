#!/bin/bash

export MYSQL_PASSWORD=123456
export MYSQL_HOST=127.0.0.1
export MYSQL_DB=zeus
export MYSQL_PORT=3306

./zeus server ./config/in-local.yaml -p 888