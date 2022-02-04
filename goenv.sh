#!/bin/bash

set_goenv() {
    platform=$(uname -s)

    if [ $platform == "Darwin" ]
    then
        brew install go
    elif [$platform == "Linux" ]
        sudo apt install -y go
    fi

    go env -w GO111MODULE=on
    go env -w GOPROXY=https://goproxy.cn,direct

    mkdir -p ~/go ; cd ~/go ; mkdir bin src pkg

    export GOPATH=$HOME/go
    export PATH=$PATH:$GOPATH/bin

    #alias go4l='CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build'
    #alias go4w='CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build'
}

set_goenv