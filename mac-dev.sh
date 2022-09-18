#!/bin/bash

base_setup() {
    name=`echo $USER`
    sudo spctl --master-disable
    sudo scutil --set HostName "$name"
    sudo scutil --set ComputerName "$name"
    xcode-select --install

    defaults write com.apple.dock autohide-time-modifier -float 0.5
    defaults write com.apple.dock autohide-delay -int 0
    defaults write com.apple.dock springboard-columns -int 9
    defaults write com.apple.dock springboard-rows -int 6
    killall Dock
}

install_brew() {
    /bin/zsh -c "$(curl -fsSL https://gitee.com/cunkai/HomebrewCN/raw/master/Homebrew.sh)"
}

fix_brew() {
    git config --global --add safe.directory /opt/homebrew/Library/Taps/homebrew/homebrew-core
    git config --global --add safe.directory /opt/homebrew/Library/Taps/homebrew/homebrew-cask
    git config --global --add safe.directory /opt/homebrew/Library/Taps/homebrew/homebrew-services
}

install_pkg() {
	pkg=("tmux" "proxychains-ng" "neovim" "tig" "git-extras" "mysql" "yarn" "mycli" "pgcli" "redis" "shellcheck" "iproute2mac" "screenfetch" "neofetch" "tree" "telnet" "gawk" "ack" "automake" "llvm" "wget" "mpg123" "m-cli" "youtube-dl" "ffmpeg" "xquartz" "bash-completion" "docker-completion" "nvm" "scc" "cloc" "protobuf" "minikube" "kubectl" "graphviz" "qlmarkdown" "syntax-highlight")
	pkg_cask=("android-platform-tools" "cmake" "mpv" "macfuse" "androidtool" "virtualbox" "vagrant" "vagrant-manager" "monitorcontrol" "font-jetbrains-mono")
    lg=("rust" "rustup""node" "typescript")
    enhenced=("q" "exa" "fd" "bat" "fff" "fzf" "nnn" "httpie" "rs/tap/curlie" "ag" "lsd" "git-delta" "dust" "duf" "broot" "ripgrep" "the_silver_searcher" "choose-rust" "jq" "sd" "tldr" "bottom" "glances" "hyperfine" "procs" "xh" "zoxide" "ffsend" "pueue" "grex" "gron" "dog")
    taps=("hashicorp/tap" "filebrowser/tap" "homebrew/cask-fonts")

    brew tap ${taps[*]}
    brew install ${pkg[*]}
    brew install ${lg[*]}
    brew install ${enhenced[*]}
	brew install --cask ${pkg_cask[*]}
}

set_goenv() {
    echo "Please install Go package first!"
    sleep 10
    go env -w GO111MODULE=on
    go env -w GOPROXY=https://goproxy.cn,direct
}

set_zsh() {
    #sh omz.sh
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
}

set_vim() {
    git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
    sh ~/.vim_runtime/install_awesome_vimrc.sh
}

set_tmux() {
    cd ; git clone https://github.com/gpakosz/.tmux.git
    ln -s -f .tmux/.tmux.conf
    cp .tmux/.tmux.conf.local .
}

set_github() {
	echo "Enter your Github email: "
	read -r email
	echo "Enter your Github username: "
	read -r username

	ssh-keygen -t rsa -b 4096 -C "$email"
	eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_rsa
	git config --global user.email "$email"
	git config --global user.name "$username"

    echo "Please copy follows SSH key and then paste it into your github SSH setting pages."
	cat ~/.ssh/id_rsa.pub
}

main() {
    echo "Before installation, please make sure you already set Clash done."
    sleep 10

    base_setup
    install_brew
    install_pkg
    set_goenv
    set_zsh
    set_vim
    set_tmux
    set_github
}

main