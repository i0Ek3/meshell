#!/bin/bash

# [WIP] use goto in bash
function goto()
{
  label=$1
  cmd=$(sed -En "/^[[:space:]]*#[[:space:]]*$label:[[:space:]]*#/{:a;n;p;ba};" "$0")
  eval "$cmd"
  exit
}

# xcode precontext
function xcode_config()
{
    sudo xcode-select --install
}

# install homebrew from China source
function install_homebrew()
{
	/bin/zsh -c "$(curl -fsSL https://gitee.com/cunkai/HomebrewCN/raw/master/Homebrew.sh)"

    # reboot to activate
	source ~/.zshrc
	brew update ; brew upgrade
}

# install oh-my-zsh and correspoding plugins
function install_ohmyzsh()
{
	curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

    # install autojump for oh-my-zsh
    brew install autojump

	git clone git://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
}

# use curl to install packages
function cur_install()
{
    # ytfzf: watch youtube on your terminal
    curl -sL "https://raw.githubusercontent.com/pystardust/ytfzf/master/ytfzf" | sudo tee /usr/bin/ytfzf >/dev/null && sudo chmod 755 /usr/bin/ytfzf

    # finderGo: open your terminal under the current path
	curl -fsSL https://raw.githubusercontent.com/onmyway133/FinderGo/master/install.sh | sh

    # sdkman: just like nvm or pyenv to manage java version
    curl -s "https://get.sdkman.io" | bash

    # oh-my-wechat
    curl -o- -L https://omw.limingkai.cn/install.sh | bash -s

    # translate shell
    wget git.io/trans ; chmod +x ./trans ; mv trans /usr/local/bin

    # up: deploy server on AWS in seconds
    curl -sf https://up.apex.sh/install | sh

    # rclone
    curl https://rclone.org/install.sh | sh
}

# use brew to install packages
function install_pkg()
{
    # specified packages
	pkg=("gdb" "fish" "tmux" "neovim" "emacs" "mas" "tig" "git-extras" "mysql" "yarn" "mycli" "pgcli" "redis" "shellcheck" "hh" "iproute2mac" "screenfetch" "neofetch" "tree" "proxychains-ng" "ideviceinstaller" "telnet" "gawk" "ack" "automake" "cmake" "llvm" "wget" "mpg123" "m-cli" "youtube-dl" "ffmpeg" "mpv" "vagrant" "docker" "xquartz" "bash-completion" "docker-completion" "nvm" "heroku/brew/heroku" "docker" "docker-machine" "scrcpy" "scc" "protobuf" "hugo" "dozer")
	pkg_cask=("iterm2" "android-platform-tools" "vscodium" "mpv" "osxfuse" "androidtool" "virtualbox" "vagrant" "vagrant-manager" "cakebrew" "monitorcontrol")
    lg=("java" "python" "go" "rust" "rustup" "scala" "sbt" "rbenv" "ruby-build" "rbenv-default-gems" "rbenv-gemset" "node" "typescript")
    enhenced=("exa" "fd" "bat" "fff" "fzf" "nnn" "httpie" "rs/tap/curlie" "ag" "lsd" "git-delta" "dust" "duf" "broot" "ripgrep" "the_silver_searcher" "mcfly" "choose-rust" "jq" "sd" "tldr" "bottom" "glances" "hyperfine" "procs" "xh" "zoxide" "ffsend" "pueue" "grex" "gron" "dog")
    alternatives=("visual-studio-code")
    taps=("hashicorp/tap")

    brew tap ${taps[*]}
    brew install --HEAD libimobiledevice
    brew install ${pkg[*]}
    brew install ${lg[*]}
    brew install ${enhenced[*]}
	brew install --cask ${pkg_cask[*]}
}

# setting proxychains4
function set_pc4()
{
    echo 'scoks5 127.0.0.1 7890' >> /usr/local/etc/proxychains.conf
    echo "If your proxy port is not 7890, please modified it manaully, config file locate at /usr/local/etc/proxychains.conf."
}

# use go to install package
function go_install()
{
    links=(
        "github.com/cheat/cheat/cmd/cheat"\
        "github.com/uber/go-torch"\
        "github.com/tidwall/gjson"\
        "github.com/agiledragon/gomonkey"\
        "github.com/timakin/bodyclose"\
        "golang.org/x/tools/cmd/godoc"\
        "github.com/google/pprof"\
    )
    pc4 go get -u ${links[*]}
}

# use pip to install packages
function pip_install()
{
	pkg=("Pillow" "virtualenv" "jupyterlab" "notebook" "termpair" "libretranslate" "youtube-search-python" "cppman" "jina" "imgcat")

    # install pip3 first if pip3 not exist
    if [ -e /usr/bin/pip3 ]
    then
	    pip3 install ${pkg[*]}
    else
        sudo easy_install pip3
	    pip3 install ${pkg[*]}
    fi
}

# install npm packages
function npm_install()
{
	pkg=("carbon-now-cli" "gitmoji-cli" "tldr" "gtop" "uglify-js" "@gauseen/gum")
	npm install -g ${pkg[*]}
}

# install then setting postgresql
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

# enable option of install package anywhere
function enable_anywhere()
{
	sudo spctl --master-disable
}

# change the hostname and computername
function change_name()
{
	name=$(echo $USER)
	echo "ok, name $name will be set on HostName and ComputerName."
	sudo scutil --set HostName "$name"
	sudo scutil --set ComputerName "$name"
}

# reset dock to fluid
function reset_dock()
{
    echo -n "Would you like [set] or [restore] your dock?"
    read -r operation
    if [ $operation == "set" ]
    then
	    defaults write com.apple.dock autohide-time-modifier -float 0.5 && killall Dock
	    defaults write com.apple.dock autohide-delay -int 0 && killall Dock
    elif [ $operation == "restore" ]
    then
        defaults delete com.apple.dock autohide-time-modifier && killall Dock
	    defaults delete com.apple.Dock autohide-delay && killall Dock
    else
        echo "Wrong input, please re-input!"
        #goto
    fi
}

# reset bootboard to compact
function bootboard_hack()
{
    echo -n "Would you like [set] or [restore] your board?"
    read -r operation
    if [ $operation == "set" ]
    then
	    defaults write com.apple.dock springboard-columns -int 9
	    defaults write com.apple.dock springboard-rows -int 6
        killall Dock
    elif [ $operation == "restore" ]
    then
	    defaults write com.apple.dock springboard-rows Default
	    defaults write com.apple.dock springboard-columns Default
        killall Dock
    else
        echo "Wrong input, please re-input!"
        #goto
    fi
}

# set socks5/http/https proxy
function set_proxy()
{
    echo -n "What's your proxy port?"
    read -r port
    if [ -s $port ]
    then
        export https_proxy=http://127.0.0.1:$port http_proxy=http://127.0.0.1:$port all_proxy=socks5://127.0.0.1:$port
    else
        export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890
    fi
}

# set goproxy
function go_proxy()
{
    go env -w GO111MODULE=on
    go env -w GOPROXY=https://goproxy.cn,direct
}

# add hosts for github
function add_hosts()
{
    # Add follows lines into your hosts.
    echo '199.232.69.194 github.global.ssl.fastly.net' >> /etc/hosts
    echo '140.82.114.4 github.com' >> /etc/hosts
}

# config github profile
function config_github()
{
	ssh-keygen -t rsa -b 4096 -C "$email"
	eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_rsa
	git config --global user.email "$email"
	git config --global user.name "$username"

    echo "Please copy follows SSH key and then paste it into your github SSH setting pages."
	cat ~/.ssh/id_rsb.pub
}

# enhence your vim
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

# set npm China mirror
function set_cn_mirror()
{
    # install cnpm
    npm install cnpm -g --registry=https://registry.nlark.com
    # for npm
    npm config set registry https://registry.npm.taobao.org
}

function fetch_info()
{
	echo "Enter your Github email: "
	read -r email
	echo "Enter your Github username: "
	read -r username
}

function basic_setup()
{
    # system setting
	cancel_shortpwd
    enable_anywhere
	bootboard_hack
	reset_dock

    #set_proxy
    xcode_config
    go_proxy
    add_hosts
    config_github
    vim_expand
}

function basic_install()
{
    # installation
    install_homebrew
	install_ohmyzsh
	install_pkg
    set_pc4
    curl_install
    go_install
	pip_install
    set_cn_mirror
	npm_install
	set_pgsql
}


function main()
{
    fetch_info
    basic_setup
    basic_install
}

main
