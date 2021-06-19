#!/bin/bash

## Install packages
install_pkgs() {
    pkgs=("yaourt" "ytfzf")

    sudo pacman -S "${pkg[*]}"
}

main() {
    ## Flash cache
    sudo pacman -Syy

    install_pkgs
}

main
