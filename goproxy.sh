#!/bin/bash

go env -w GO111MODULE=on
go env -w GOPROXY=https://goproxy.io,direct
export GOPROXY=https://goproxy.cn
