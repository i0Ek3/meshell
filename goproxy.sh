#!/bin/bash

function set_goproxy()
{
	go env -w GO111MODULE=on
	go env -w GOPROXY=https://goproxy.io,direct
	export GOPROXY=https://goproxy.cn
}

function main()
{
	set_goproxy
}

main
