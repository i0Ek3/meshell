#!/bin/bash

# Next update: parameterlize program and enhance encrypt level
#
# Usage: ./pwdIterator.sh [encrypt type] [contents] [times]
#   with 2 parameters:
#       ./pwdIterator.sh md5 iso2img.sh
#   or 3:
#       ./pwdIterator.sh md5 "abcdf" 5

echo -n "Which way you want to encrypt(md5 sha1 sha256 sha512): "
read encrypt
echo -n "Which type you want to convert(file or str): "
read type
echo -n "Please input your full path file's name or str contents: "
read contents
#echo -n "Please input times you want to iterator: "
#read time
echo -e "\033[34m Okay, thank you for your patient! \033[0m"

# macOS
# sha support 1 (default), 224, 256, 384, 512, 512224, 512256

function calculateHash()
{
    if [ $type == "file" ]
    then
        if [ $encrypt == "md5" ]
        then
            echo $(md5 $contents)
        elif [ $encrypt == "sha1" ]
        then
            echo $(shasum -a 1 $contents)
        elif [ $encrypt == "sha256" ]
        then
            echo $(shasum -a 256 $contents)
        elif [ $encrypt == "sha512" ]
        then
            echo $(shasum -a 512 $contents)
        else
            echo -e "\033[31m Wrong input, exitting... \033[0m"
        fi
    elif [ $type == "str" ]
    then
        if [ $encrypt == "md5" ]
        then
            echo -n $contents | md5 | awk '{print $contents}'
        elif [ $encrypt == "sha1" ]
        then
            echo -n $contents | shasum -a 1 | awk '{print $contents}'
        elif [ $encrypt == "sha256" ]
        then
            echo -n $contents | shasum -a 256 | awk '{print $contents}'
        elif [ $encrypt == "sha512" ]
        then
            echo -n $contents | shasum -a 512 | awk '{print $contents}'
        else
            echo -e "\033[31m Wrong input, exitting... \033[0m"
        fi
    else
        echo -e "\033[31m Wrong input, exitting... \033[0m"
    fi
}

calculateHash

#for (( times = 1; times <= $time; times++ ))
#do
#    ret = $(echo -n $1 | md5 | awk '{print $1}')
#    echo -n $ret | md5 | awk '{print $ret}'
#done
