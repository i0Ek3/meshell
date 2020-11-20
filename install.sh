#!/bin/bash

## Update
sudo apt update && sudo apt upgrade

## based install
sudo apt-get install vim neovim build-essential file clang g++ libdbus-1-dev libgtk2.0-dev \
                     libnotify-dev libgnome-keyring-dev libgconf2-dev \
                     libasound2-dev libcap-dev libcups2-dev libxtst-dev \
                     libxss1 libnss3-dev gcc-multilib g++-multilib curl ack gwk \
                     gperf bison libncurses5-dev automake android-tools-adb \
                     android-tools-fastboot python3-pip uget vlc geany aria2 \
                     screenfetch tmux screen gedit redshift lynx inxi transmission-gtk \
                     rar unrar aptitude && sudo aptitude install autotools-dev \
                     libgtk2.0-dev libscim-dev libtool cmake proxychains snapd \
                     opencc mercurial fcitx fcitx-config-gtk fcitx-googlepinyin \

## Linuxbrew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

## fish
sudo apt install fish
curl -L https://get.oh-my.fish | fish

## Git + ZSH
## http://blog.csdn.net/gatieme/article/details/52741221
sudo add-apt-repository ppa:git-core/ppa && sudo apt update && sudo apt install git
sudo apt install zsh && chsh -s /bin/zsh && sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

## npm
npm i -g carbon-now-cli leetcode-cli yddict hackmyresume tldr

## icon theme
sudo add-apt-repository ppa:papirus/papirus && sudo apt-get update && sudo apt-get install papirus-icon-theme

## java
sudo add-apt-repository ppa:webupd8team/java && sudo apt update && sudo apt install oracle-java8-installer && sudo apt-get install oracle-java8-set-default && source /etc/profile

## Idea Dev
## ultimate: sudo apt install intellij-idea-ultimate
## Package Installation:
##      tar zxvf xxxxxx.tar.gz
##      sudo mkdir -p /opt/xxxxxx
##      sudo mv xxxxxx/ /opt/xxxxxx
##      sudo ln -s /opt/xxxxxx/bin/xxxxxx.sh /usr/local/bin/xxxxxx
## boot: xxxxxx
## uninstallation: sudo rm /opt/xxxxxx/ -R

## Wd-dict
sudo pip3 install bs4 lxml && cd /media/ianpasm/ianpasmer/g1thu6/third/wudao-dict/wudao-dict/ && sudo bash setup.sh

## Musicbox
sudo pip3 install NetEase-MusicBox && sudo apt install mpg123

## Sublime-text
#wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add - && sudo apt-get install apt-transport-https
# stable
#echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
# dev
#echo "deb https://download.sublimetext.com/ apt/dev/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
#sudo apt update && sudo apt install sublime-text

sudo apt update && sudo apt upgrade
