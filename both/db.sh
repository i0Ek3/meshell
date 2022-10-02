#!/bin/bash

install_db() {
    platform=$(uname -s)

    if [ $platform == "Darwin" ]
    then
        brew update ; brew upgrade
        brew install mysql postgresql@14 redis
        brew services restart mysql
        brew services restart postgresql@14
        brew services restart redis
    elif [ $platform == "Linux" ]
    then
        sudo apt update ; sudo apt install -y mysql postgresql redis
    else
        echo "Unsupport platform!"
    fi
}

install_db
