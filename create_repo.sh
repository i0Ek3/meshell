#!/bin/bash

mkdir $1
cd $1
go mod init github.com/i0Ek3/$1

path="/usr/local/bin/readme"
if [ -e $path ]
then
    readme
else
    npm install -g readme-md-generator
fi
