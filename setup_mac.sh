#!/bin/bash

function install_homebrew()
{
	/bin/zsh -c "$(curl -fsSL https://gitee.com/cunkai/HomebrewCN/raw/master/Homebrew.sh)"
	echo 'export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles' >> ~/.zshrc
	source ~/.zshrc
	brew update ; brew upgrade
	#sudo chown -R $(whoami) /usr/local/share/man/man8
	#chmod u+w /usr/local/share/man/man9
}

function install_ohmyzsh()
{
	curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh	
	git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
}

function install_pkg()
{
	pkg=("fish" "tmux" "neovim" "mas" "tig" "git-extras" "node" "mysql" "yarn" "mycli" "pgcli" "redis" "shellcheck" "hh" "ripgrep" "iproute2mac" "screenfetch" "neofetch" "tree" "proxychains-ng" "autojump" "ideviceinstaller" "telnet" "gawk" "ack" "ag" "automake" "cmake" "llvm" "wget" "exa" "fd" "bat" "fff" "nnn" "httpie" "mpg123" "rust" "go" "m-cli")
	pkg_cask=("android-platform-tools" "vscodium" "mpv" "osxfuse" "androidtool") 
	
	brew install --HEAD libimobiledevice
        brew install ${pkg[*]}
	brew install --cask ${pkg_cask[*]}

	curl -fsSL https://raw.githubusercontent.com/onmyway133/FinderGo/master/install.sh | sh

    	echo 'scoks5 127.0.0.1 1086' >> /usr/local/etc/proxychains.conf
}

function pip_install()
{
	pkg=("Pillow" "virtualenv" "NetEase-Music" "jupyterlab" "notebook")
	pip3 install ${pkg[*]}
}

function npm_install()
{
	pkg=("carbon-now-cli" "gitmoji-cli" "yddict" "tldr")
	npm install -g ${pkg[*]}
}

function set_pgsql()
{
	brew install postgresql
	initdb /usr/local/var/postgres
	brew services start postgresql
}

function cancel_shortpwd()
{
	pwpolicy -clearaccountpolicies
	echo "short password cancelled, run command `passwd` to change your password!"
}

function enable_anywhere()
{
	sudo spctl --master-disable
}

function change_name()
{
	name=$(echo $USER)
	echo "ok, name $name will be set on HostName and ComputerName."
	sudo scutil --set HostName "$name"
	sudo scutil --set ComputerName "$name"
}

function kill_dock()
{
	defaults write com.apple.dock autohide-time-modifier -float 0.5 && killall Dock
	#defaults delete com.apple.dock autohide-time-modifier && killall Dock
	defaults write com.apple.dock autohide-delay -int 0 && killall Dock
	#defaults delete com.apple.Dock autohide-delay && killall Dock
}

function bootborad_hack()
{
	defaults write com.apple.dock springboard-columns -int 9
	defaults write com.apple.dock springboard-rows -int 6
	#defaults write com.apple.dock springboard-rows Default
	#defaults write com.apple.dock springboard-columns Default
	killall Dock
}

function main()
{
	install_homebrew
	bootborad_hack
	kill_dock
	install_ohmyzsh
	install_pkg
	cancel_shortpwd		
	set_pgsql
	pip_install
	npm_install
}

main
