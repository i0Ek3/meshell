#!/bin/bash

function declaration()
{
    echo "This code from the other who post on shaoshupai, I just modified something."
}

function clean_cask()
{
    for cask_link in $(find $HOME/Library/Caches/Homebrew/Cask -type l)
    do
        let file_count++
        trash $(realpath $cask_link)
        let link_count++
        rm $link
    done
}

function clean_brew()
{
    for link in $(find $HOME/Library/Caches/Homebrew -type l)
    do
        let file_count++
        trash $(realpath $link)
        let link_count++
        rm $link
    done
}

function clean_incomplete()
{
    let incomplete_count=$(ls -l $HOME/Library/Caches/Homebrew/downloads/*.incomplete | wc -l)
    rm $HOME/Library/Caches/Homebrew/downloads/*.incomplete
}

function plural()
{
    if [ $1 -gt 1 ]
    then
        echo "$1 $2s"
    else
        echo "$1 $2"
    fi
}

function main()
{
    file_count=0
    link_count=0
    incomplete_count=0

    declaration
    clean_cask
    clean_brew
    clean_incomplete
    echo "Pruned $(plural $link_count "symbolic link"), $(plural $file_count "file") and $(plural $incomplete_count "incomplete download") from $(realpath $HOME/Library/Caches/Homebrew)"

    brew cleanup
}

main
