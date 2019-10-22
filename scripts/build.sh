#!/bin/bash
export GO111MODULE=on
export GOPROXY=https://goproxy.cn
go build --ldflags "-extldflags -static" -o zeus
