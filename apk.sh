#! /bin/bash

function apk_install()
{
	apk update ; apk upgrade
	apk add git vim zsh tmux fish npm sudo g++ clang++ curl openssh python3
}

function vim_install()
{
	git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
	sh ~/.vim_runtime/install_awesome_vimrc.sh
}

function npm_install()
{
	npm install yddict -g
}

function main()
{
	apk_install
	vim_install
	npm_install
}

main
