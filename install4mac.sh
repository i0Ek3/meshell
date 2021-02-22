#!/bin/bash

# homebrew & homebrew cask
/bin/zsh -c "$(curl -fsSL https://gitee.com/cunkai/HomebrewCN/raw/master/Homebrew.sh)"

# basic
brew install vim neovim git git-lfs tmux tree screenfetch mas emojify tig git-extras

# oh-my-fish
brew install fish
#curl -L https://get.oh-my.fish | fish

# m-cli https://github.com/rgcr/m-cli
brew install m-cli
#curl -fsSL https://raw.githubusercontent.com/rgcr/m-cli/master/install.sh | sh

# Mac Cli
sh -c "$(curl -fsSL https://raw.githubusercontent.com/guarinogabriel/mac-cli/master/mac-cli/tools/install)"

# zsh & oh-my-zsh
brew install zsh
chsh -s /bin/zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# node && nvm
brew install node
curl -L https://www.npmjs.com/install.sh | sh

# cnpm
npm install -g cnpm --registry=https://registry.npm.taobao.org

# common software
brew install --cask androidtool java mpv osxfuse ndm android-platform-tools vscodium
brew install --HEAD libimobiledevice; brew install ideviceinstaller # for ios device
brew install telnet gawk ack ag autojump automake cmake llvm proxychains-ng wget gpg mysql redis postgresql mpg123 git-flow zsh-autosuggestions the_silver_searcher mycli pgcli mps-youtube sshfs watch exa fd bat fzf nnn asciinema httpie sshrc qemu
brew tap eddieantonio/eddieantonio ; brew install shellcheck hexyl hh ripgrep
brew tap timothyye/tap ; brew install timothyye/tap/ydict timothyye/tap/exchangerate reattach-to-user-namespace snaipe/soft/criterion
brew tap dart-lang/dart ; brew install dart python3 go clojure sbcl sbt@1 kotlin luarocks elixir erlang rust
export TOOLCHAINS=swift # for swift

# fuckGFW
brew tap trojan-gfw/homebrew-trojan
brew install trojan

# gvm
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

# nix package magement
curl https://nixos.org/nix/install | sh

# fira font
brew tap caskroom/fonts
brew install --cask font-fira-code

# ruby env rvm
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB ; \curl -sSL https://get.rvm.io | bash -s stable
source $HOME.rvm/scripts/rvm; rvm install ruby
brew install rbenv

# rust
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env
export PATH="$HOME/.cargo/bin:$PATH"

# finder-go
curl -fsSL https://raw.githubusercontent.com/onmyway133/FinderGo/master/install.sh | sh

# pip
version=20.3.3
sudo easy_install pip ; pip3 install Pillow virtualenv django pipupgrade loguru
sudo pip3 install pip==$version
sudo pip3 install NetEase-Music rebound-cli ranger-fm
pi3 jupyterlab notebook voila

# npm software
npm install -g leetcode-cli carbon-now-cli gitmoji-cli fast-cli splash-cli yddict tldr
yarn add docz docz-theme-default --dev
npm install -g svg-term-cli

echo "All done!"
