#!/bin/bash

install_db() {
    platform=$(uname -s)

    if [ $platform == "Darwin" ]
    then
        brew update ; brew upgrade
        brew install mysql postgresql redis
    elif [ $platform == 'Linux' ]
    then
        sudo apt update ; sudo apt install -y mysql postgresql redis
    else
        echo "Unsupport platform!"
    fi
}

install_db
