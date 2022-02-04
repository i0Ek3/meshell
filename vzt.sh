#!/bin/bash

vim() {
    echo "Configurating tmux..."
    git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
    sh ~/.vim_runtime/install_awesome_vimrc.sh
    echo "vim config done!"
}

zsh() {
    echo "Configurating tmux..."
    sh install_omz.sh
    git clone git://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    echo "zsh config done!"
}

tmux() {
    echo "Configurating tmux..."
    cd ; git clone https://github.com/gpakosz/.tmux.git
    ln -s -f .tmux/.tmux.conf
    cp .tmux/.tmux.conf.local .
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    echo "tmux config done!"
}

main() {
    vim
    zsh
    tmux
}

main