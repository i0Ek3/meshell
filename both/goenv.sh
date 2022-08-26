#!/bin/bash

install_go() {
    platform=$(uname -s)

    if [ $platform == "Darwin" ]
    then
        brew install go
        set_env
        export_path
    elif [$platform == "Linux" ]
        install_go_by_source
        set_env
    fi
}

set_env() {
    go env -w GO111MODULE=on
    go env -w GOPROXY=https://goproxy.cn,direct

    mkdir -p ~/go ; cd ~/go ; mkdir bin src pkg
}

export_path() {
    export GOPATH=$HOME/go
    export PATH=$PATH:$GOPATH/bin

    #alias go4l='CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build'
    #alias go4w='CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build'
}

install_go_by_source() {
    # TODO: fetch version by script instead of hardcode
    version=1.19
    wget https://go.dev/dl/go${version}.linux-amd64.tar.gz
    rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go${version}.linux-amd64.tar.gz
    export PATH=$PATH:/usr/local/go/bin
}

main() {
    install_go
}

main
