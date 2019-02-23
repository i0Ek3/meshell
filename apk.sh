#! /bin/bash

## Application for Alpine Linux

apk update
apk upgrade
apk add git vim zsh tmux fish npm sudo g++ clang++ curl openssh python2 python3

curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh

npm install yddict -g
