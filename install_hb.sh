#!/bin/bash

set -x

setpxy
git -C "$(brew --repo)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git
git -C "$(brew --repo homebrew/core)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git
git clone git://mirrors.ustc.edu.cn/homebrew-core.git/ /usr/local/Homebrew/Library/Taps/homebrew/homebrew-core --depth=1
/usr/bin/ruby -e "$(curl -fsSL https://hellogithub.cn-bj.ufileos.com/file/brew_install.sh)"
bu
unpxy
