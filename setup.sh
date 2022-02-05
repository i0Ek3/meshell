#!/bin/bash

# xcode precontext
xcode_config() {
    sudo xcode-select --install
}

# install homebrew from China source
install_homebrew() {
	/bin/zsh -c "$(curl -fsSL https://gitee.com/cunkai/HomebrewCN/raw/master/Homebrew.sh)"

    # reboot to activate
	source ~/.zshrc
	brew update ; brew upgrade
}

# use curl to install packages
curl_install() {
    # code-server: run vs code anywhere
    curl -fsSL https://code-server.dev/install.sh | sh

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

    # nami: a binary manage package
    source <(curl -L https://git.io/getnami)

    # rustup
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

    # reviewdog
    curl -sfL https://raw.githubusercontent.com/reviewdog/nightly/master/install.sh | sh -s -- -b $(go env GOPATH)/bin

    # forgit
    source <(curl -sSL git.io/forgit)

    # rclone
    curl https://rclone.org/install.sh | sudo bash

    # k3s
    curl -sfL https://get.k3s.io | sh -

    # k8s
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/amd64/kubectl"

    # minikube
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64
    sudo install minikube-darwin-amd64 /usr/local/bin/minikube
}

# use brew to install packages
install_pkg() {
    # specified packages
	pkg=("gdb" "fish" "tmux" "neovim" "emacs" "mas" "tig" "git-extras" "mysql" "yarn" "mycli" "pgcli" "redis" "shellcheck" "hh" "iproute2mac" "screenfetch" "neofetch" "tree" "proxychains-ng" "ideviceinstaller" "telnet" "gawk" "ack" "automake" "cmake" "llvm" "wget" "mpg123" "m-cli" "youtube-dl" "ffmpeg" "mpv" "vagrant" "docker" "xquartz" "bash-completion" "docker-completion" "nvm" "heroku/brew/heroku" "docker" "docker-machine" "scrcpy" "scc" "cloc" "protobuf" "hugo" "dozer" "create-dmg"
"zig" "zsh-vi-mode" "slides" "pywin32" "minikube" "kubectl" "kubectx" "kind" "graphviz" "t-rec" "gitui" "infracost" "hashicorp/tap/terraform" "hashicorp/tap/consul" "pdfcpu" "flamegraph" "certbot" "pass" "filebrowser" "picgo" "upic" "sachaos/tap/viddy" "k6" "onefetch" "leiningen" "pdm" "ddosify/tap/ddosify" "knqyf263/pet/pet" "ocrmypdf" "pipx" "glide" "reattach-to-user-namespace")
	pkg_cask=("iterm2" "android-platform-tools" "vscodium" "mpv" "osxfuse" "androidtool" "virtualbox" "vagrant" "vagrant-manager" "cakebrew" "monitorcontrol" "font-jetbrains-mono")
    lg=("java" "python" "go" "rust" "rustup" "scala" "sbt" "rbenv" "ruby-build" "rbenv-default-gems" "rbenv-gemset" "node" "typescript")
    enhenced=("q" "exa" "fd" "bat" "fff" "fzf" "nnn" "httpie" "rs/tap/curlie" "ag" "lsd" "git-delta" "dust" "duf" "broot" "ripgrep" "the_silver_searcher" "choose-rust" "jq" "sd" "tldr" "bottom" "glances" "hyperfine" "procs" "xh" "zoxide" "ffsend" "pueue" "grex" "gron" "dog")
    alternatives=("visual-studio-code")
    taps=("hashicorp/tap" "filebrowser/tap" "homebrew/cask-fonts")

    brew tap ${taps[*]}
    brew install --HEAD libimobiledevice
    brew install ${pkg[*]}
    brew install ${lg[*]}
    brew install ${enhenced[*]}
	brew install --cask ${pkg_cask[*]}
}

# install package for Linux
install_pkg4L() {
    sudo apt install -y openssh-server openssh-client
    sudo service ssh restart
}

# set proxy
set_proxy() {
    echo -n "What's your proxy port? [7890 for Clash, 1080 for Shadowsocks/V2ray]"
    read -r port
    echo 'scoks5 127.0.0.1 $port' >> /usr/local/etc/proxychains.conf
    export https_proxy=http://127.0.0.1:$port http_proxy=http://127.0.0.1:$port all_proxy=socks5://127.0.0.1:$port
}

# use go to install package
go_install() {
    links=(
        "gorm.io/gorm"\
        "gorm.io/driver/sqlite"\
        "github.com/cheat/cheat/cmd/cheat"\
        "github.com/davecheney/httpstat"\
        "github.com/uber/go-torch"\
        "github.com/tsliwowicz/go-wrk"\
        "github.com/tidwall/gjson"\
        "github.com/agiledragon/gomonkey"\
        "github.com/timakin/bodyclose"\
        "golang.org/x/tools/cmd/godoc"\
        "github.com/google/pprof"\
        "github.com/MarvinJWendt/testza"\
        "github.com/onsi/ginkgo/ginkgo"\
        "github.com/onsi/gomega/..."\
        "github.com/PuerkitoBio/goquery"\
        "github.com/xuri/excelize/v2"\
    )
    go get -u ${links[*]}
}

# use pip to install packages
pip_install() {
	pkg=("Pillow" "virtualenv" "jupyterlab" "notebook" "termpair" "libretranslate" "youtube-search-python" "cppman" "jina" "imgcat" "flit" "xxh-xxh")

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
npm_install() {
	pkg=("carbon-now-cli" "gitmoji-cli" "tldr" "gtop" "uglify-js" "@gauseen/gum" "jquery" "webpack" "webpack-cli" "json-server" "eslint" "eslint-plugin-import" "eslint-config-airbnb-base" "mocha" "chai" "markdown-it" "docsify-cli" "bower" "gulp-cli" "monaco-editor" "puppeteer" "picgo" "hacker-feeds-cli" "node-wifi-cli")
	npm install -g ${pkg[*]}
}

# install package for ML/DL
mldl_install() {
    pkg=("tensorflow" "torch" "torchvision")
    pip3 install ${pkg[*]}
}

# set npm China mirror
set_cn_mirror() {
    # install cnpm
    npm install cnpm -g --registry=https://registry.nlark.com
    # for npm
    npm config set registry https://registry.npm.taobao.org
}

common() {
    curl_install
    go_install
	pip_install
    set_cn_mirror
	npm_install
}

mac() {
    xcode_config
    install_homebrew
	install_pkg
    mldl_install
    set_proxy
    # pc4 is an aliased for proxychains4
    pc4 common
}

linux() {
    common
    install_pkg4L
}

main {
    platform=$(uname -s)
    if [ $platform == "Darwin" ]
    then
        mac
    elif [ $platform == 'Linux' ]
    then
        linux
    else
        echo "Unsupport platform!"
    fi
}

main
