#!/bin/bash

function install_homebrew()
{
	/bin/zsh -c "$(curl -fsSL https://gitee.com/cunkai/HomebrewCN/raw/master/Homebrew.sh)"
	echo 'export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles' >> ~/.zshrc
	source ~/.zshrc
	brew update ; brew upgrade
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

    # finderGo: open your terminal under the current path
	curl -fsSL https://raw.githubusercontent.com/onmyway133/FinderGo/master/install.sh | sh

    echo 'scoks5 127.0.0.1 1086' >> /usr/local/etc/proxychains.conf
    echo "If your proxy port is not 1086, please modified it manaully, config file locate at /usr/local/etc/proxychains.conf."
}

function pip_install()
{
	pkg=("Pillow" "virtualenv" "NetEase-Music" "jupyterlab" "notebook")
    if [ -e /usr/bin/pip3 ]
    then
	    pip3 install ${pkg[*]}
    else
        sudo easy_install pip3
	    pip3 install ${pkg[*]}
    fi
}

function npm_install()
{
	pkg=("carbon-now-cli" "gitmoji-cli" "yddict" "tldr")
    npm config set registry https://registry.npm.taobao.org
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
	defaults write com.apple.dock autohide-delay -int 0 && killall Dock
	
    # restore
    #defaults delete com.apple.dock autohide-time-modifier && killall Dock
	#defaults delete com.apple.Dock autohide-delay && killall Dock
}

function bootborad_hack()
{
	defaults write com.apple.dock springboard-columns -int 9
	defaults write com.apple.dock springboard-rows -int 6

    # restore
	#defaults write com.apple.dock springboard-rows Default
	#defaults write com.apple.dock springboard-columns Default
	
    killall Dock
}

function set_proxy()
{
    # socks5/http/https proxy
    echo -n "What's your proxy port?"
    read -r port
    if [ -s $port ]
    then
        export https_proxy=http://127.0.0.1:$port http_proxy=http://127.0.0.1:$port all_proxy=socks5://127.0.0.1:$port
    else
        export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890
    fi

    # goproxy
    go env -w GO111MODULE=on
	go env -w GOPROXY=https://goproxy.io,direct
	export GOPROXY=https://goproxy.cn

    # github 
    # Add follows lines into your hosts.
    echo '199.232.69.194 github.global.ssl.fastly.net' >> /etc/hosts
    echo '140.82.114.4 github.com' >> /etc/hosts
}

function config_github()
{
	ssh-keygen -t rsa -b 4096 -C "$email"
	eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_rsa
	git config --global user.email "$email"
	git config --global user.name "$username"
	
    echo "Please copy follows SSH key and then paste it into your github SSH setting pages."
	cat ~/.ssh/id_rsb.pub
}

function vim_expand()
{
    tar cvf vim_$(date).tar.gz $HOME/.vim*
    rm -rf $HOME/.vim*
    
    echo "which vim config you want to set?[amix or chxuan]"
    read -r need
    
    if [ $need = "amix" ]
    then
        git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime ; sh ~/.vim_runtime/install_awesome_vimrc.sh
    else
        git clone https://github.com/chxuan/vimplus.git ~/.vimplus ; cd ~/.vimplus ; ./install.sh
    fi
}

function main()
{
	echo "Enter your Github email: "
	read -r email
	echo "Enter your Github username: "
	read -r username

	install_homebrew
	bootborad_hack
	kill_dock
	install_ohmyzsh
	install_pkg
	cancel_shortpwd		
	set_pgsql
	pip_install
	npm_install
    set_proxy
    config_github
}

main
