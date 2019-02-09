#!/bin/bash

# homebrew & homebrew cask
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# basic
brew install git git-lfs zsh tmux fish tree screenfetch mas emojify bat
brew install tig git-extras # for github
brew cask install mark-text aria2gui switchhosts

# m-cli https://github.com/rgcr/m-cli
# brew install m-cli
curl -fsSL https://raw.githubusercontent.com/rgcr/m-cli/master/install.sh | sh

# Mac Cli
sh -c "$(curl -fsSL https://raw.githubusercontent.com/guarinogabriel/mac-cli/master/mac-cli/tools/install)"

# zsh & oh-my-zsh
chsh -s /bin/zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# vim
curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh

# node && nvm
brew install node 
curl -L https://www.npmjs.com/install.sh | sh
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34/install.sh | bash

# common software
brew install gawk ack ag autojump automake cmake llvm proxychains-ng python3 go java wget gpg ant maven tomcat jetty hub mysql redis postgresql gradle mpg123 git-flow zsh-autosuggestions 
brew postinstall python3
brew install the_silver_searcher mycli pgcli
brew tap xo/xo ; brew install usql 
brew install nektos/tap/act # https://github.com/nektos/act
brew install joplin # editor
brew install mps-youtube # https://github.com/mps-youtube/mps-youtube

# cli app
brew tap timothyye/tap
brew install timothyye/tap/ydict timothyye/tap/exchangerate

# nix package magement
curl https://nixos.org/nix/install | sh

# fairfont
brew tap caskroom/fonts
brew cask install font-fira-code

# ruby env rvm
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB ; \curl -sSL https://get.rvm.io | bash -s stable
source $HOME.rvm/scripts/rvm; rvm install ruby

# rust
curl https://sh.rustup.rs -sSf | sh


# finder-go
curl -fsSL https://raw.githubusercontent.com/onmyway133/FinderGo/master/install.sh | sh

# adb tools
brew cask install android-platform-tools

# pip
sudo easy_install pip ; pip install virtualenv django pipupgrade
sudo pip3 install asciinema NetEase-Music rebound-cli

# npm software
npm install -g leetcode-cli carbon-now-cli gitmoji-cli fast-cli splash-cli
yarn add docz docz-theme-default --dev

echo "All done!"


