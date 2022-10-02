#!/bin/bash

# Next update: parameterlize program and enhance encrypt level
#
# Usage: ./pwdIterator.sh [encrypt type] [contents] [times]
#   with 2 parameters:
#       ./pwdIterator.sh md5 iso2img.sh
#   or 3:
#       ./pwdIterator.sh md5 "abcdf" 5

algo=("md5" "sha1" "sha256" "sha512")
echo -n "Please choose an algorithm from ["md5"/"sha1"/"sha256"/"sha512"]: "
read encrypt

if [ $encrypt != "md5" -a $encrypt != "sha1" -a $encrypt != "sha256" -a $encrypt != "sha512" ]
then
    echo -e "\033[31m Unsupported algorithm \033[0m"
    exit
fi

echo -n "Please input [file] or [str]: "
read type

if [ $type != "file" -a $type != "str" ]
then
    echo -e "\033[31m Unsupported type \033[0m"
    exit
fi

echo -n "Please specific a file or typing something: "
read contents


#echo -n "Please input times you want to iterator: "
#read time
echo -e "\033[34m Okay, thank you for your patient! \033[0m"

# macOS
# sha support 1 (default), 224, 256, 384, 512, 512224, 512256

calculateHash() {
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
        fi
    elif [ $type == "str" ]
    then
        if [ $encrypt == "md5" ]
        then
            echo -n $contents | md5
        elif [ $encrypt == "sha1" ]
        then
            echo -n $contents | shasum -a 1
        elif [ $encrypt == "sha256" ]
        then
            echo -n $contents | shasum -a 256
        elif [ $encrypt == "sha512" ]
        then
            echo -n $contents | shasum -a 512
        fi
    else
        echo -e "\033[31m Wrong input, bye... \033[0m"
    fi
}

calculateHash

#for (( times = 1; times <= $time; times++ ))
#do
#    ret = $(echo -n $1 | md5 | awk '{print $1}')
#    echo -n $ret | md5 | awk '{print $ret}'
#done
