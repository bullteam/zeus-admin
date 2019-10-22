#!/bin/bash
export GO111MODULE=on
export GOPROXY=https://goproxy.io
go build --ldflags "-extldflags -static" -o zeus