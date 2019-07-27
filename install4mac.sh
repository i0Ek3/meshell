#!/bin/bash

# homebrew & homebrew cask
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# basic
brew install vim neovim git git-lfs zsh tmux tree screenfetch mas emojify
brew install tig git-extras # for github

# oh-my-fish
brew install fish
curl -L https://get.oh-my.fish | fish

# m-cli https://github.com/rgcr/m-cli
# brew install m-cli
curl -fsSL https://raw.githubusercontent.com/rgcr/m-cli/master/install.sh | sh

# Mac Cli
sh -c "$(curl -fsSL https://raw.githubusercontent.com/guarinogabriel/mac-cli/master/mac-cli/tools/install)"

# zsh & oh-my-zsh
chsh -s /bin/zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# gitea
#brew tap go-gitea/gitea
#brew install gitea

# vim
#curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh

# node && nvm
brew install node 
curl -L https://www.npmjs.com/install.sh | sh
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

# common software
brew install telnet gawk ack ag autojump automake cmake llvm proxychains-ng python3 go java wget gpg mysql redis postgresql mpg123 git-flow zsh-autosuggestions 
brew postinstall python3
brew install the_silver_searcher mycli pgcli
#brew tap xo/xo ; brew install usql 
brew install nektos/tap/act # https://github.com/nektos/act
brew install mps-youtube # https://github.com/mps-youtube/mps-youtube
brew install smallstep/smallstep/step
brew cask install osxfuse
brew install sshfs watch
brew cask install ndm
brew tap eddieantonio/eddieantonio
brew install exa fd bat fzf nnn asciinema httpie sshrc rust goaccess ncdu
brew install shellcheck hexyl hh ripgrep
brew cask install android-platform-tools
brew tap timothyye/tap ; brew install timothyye/tap/ydict timothyye/tap/exchangerate
brew install reattach-to-user-namespace
brew install snaipe/soft/criterion # test frame
brew install luarocks
brew install elixir erlang
brew tap dart-lang/dart ; brew install dart
brew install clojure
brew install sbcl # for lisp
brew install sbt@1 # for scala
brew install kotlin
export TOOLCHAINS=swift # for swift
brew install qemu
brew cask install vscodium


# gvm
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

# nix package magement
curl https://nixos.org/nix/install | sh

# fairfont
brew tap caskroom/fonts
brew cask install font-fira-code

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
sudo easy_install pip ; pip install virtualenv django pipupgrade
sudo pip3 install NetEase-Music rebound-cli ranger-fm

# npm software
npm install -g leetcode-cli carbon-now-cli gitmoji-cli fast-cli splash-cli yddict tldr
yarn add docz docz-theme-default --dev
npm install -g svg-term-cli

echo "All done!"


