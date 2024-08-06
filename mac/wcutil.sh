#!/bin/bash


function usage() {
     echo " wcutil - A WeChat util tool for macOS."
     echo " Usage: $0 [argument]
--version, -v
--backup,  -b {all, media}
--delete,  -d {all, media}
--help,    -h"
     exit 1
}

function msg() {
    echo "wrong input"
    exit 1
}

function get_id() {
    echo "we cannot use common method to get your encrypted wechat id, which length is 32"
    ls -alh "$HOME/Library/Containers/com.tencent.xinWeChat/Data/Library/Application Support/com.tencent.xinWeChat/2.0b4.0.9"
    echo -r "you can copy it manually and paste it in terminal"
    sleep 5
    echo -n "copy it now"
    read id
}

function enter() {
    version=`cd "$HOME/Library/Containers/com.tencent.xinWeChat/Data/Library/Application Support/com.tencent.xinWeChat" | head -n 1`
    inner=`cd "$HOME/Library/Containers/com.tencent.xinWeChat/Data/Library/Application Support/com.tencent.xinWeChat/$version"`
    cd "$HOME/Library/Containers/com.tencent.xinWeChat/Data/Library/Application Support/com.tencent.xinWeChat/$version"
}

function delete() {
    enter
    if [ $1 == "-d" ] -o [ $1 == "--delete" ]
    then
        if [ $2 == "all" ]
        then
            delete_all
        elif [ $2 == "media" ]
        then 
            delete_message
        else
            msg
        fi
    else
        msg
    fi
}

function backup() {
    enter
    if [ $1 == "-b" ] -o [ $1 == "--backup" ]
    then
        if [ $2 == "all" ]
        then
            backup_all
        elif [ $2 == "media" ]
        then
            backup_message
        else
            msg
        fi
    else
        msg
    fi
}

function delete_all() {
    rm -rf $path
    echo "$path deleted!"
}

function backup_all() {
    cp -r $path ~/wc_backup/com.tencent.xinWeChat.bak
    echo "$path backuped into ~/wc_backup!"
}

function backup_message() {
    enter
    cd Message
    cp -r MessageTemp ~/wc_backup
    echo "Message/MessageTemp backuped!"
}

function delete_message() {
    enter
    rm -rf Message/MessageTemp
    echo "Message/MessageTemp deleted!"
}

function create_backup() {
    if [ ! -e ~/wc_backup ]
    then
        mkdir -p ~/wc_backup
    fi
}

function main() {
    create_backup

    get_id
    
    if [ $# -ne 1 ]
    then
        usage
    elif [ $1 == "-b" ] -o [ $1 == "--backup" ]
    then
        backup
    elif [ $1 == "-d" ] -o [ $1 == "--delete" ]
    then
        delete
    elif [ $1 == "-v" ] -o [ $1 == "--version" ]
    then
        echo $version
    else
        msg
    fi
}

main
