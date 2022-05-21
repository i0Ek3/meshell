#!/bin/bash

config_fish() {
    platform=$(uname -s)

    if [ $platform == 'Darwin' ]
    then
        brew install fish
        echo “/usr/local/bin/fish” | sudo tee -a /etc/shells
    else
        sudo apt install -y fish
        echo "/usr/bin/fish" | sudo tee -a /etc/shells
    fi
    chsh -s /usr/local/bin/fish
}

config_fish