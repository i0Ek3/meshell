#!/bin/bash

rm2() {
    sudo rm -rf "/Library/Frameworks/Python.framework/Versions/2.*"
    sudo rm -rf "/Applications/Python\ 2.*"
    ls -l /usr/local/bin | grep '../Library/Frameworks/Python.framework/Versions/2.*'
    cd /usr/local/bin/ ; ls -l /usr/local/bin | grep '../Library/Frameworks/Python.framework/Versions/2.*' | awk '{print $9}' | tr -d @ | xargs rm
}

rmall() {
    sudo rm -rf /Library/Frameworks/Python.framework
    ls -l /usr/local/bin | grep '..Current/Library/Of/Frameworks/Python.framework' | awk '{print $9}' | tr -d @ | xargs rm
}

reinstall_py3() {
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    python3 get-pip.py --force-reinstall
}

main() {
    echo "Action? [remove, reinstall]"
    read -r action
    if [ $action == "remove"]
    then
        echo "Version? [2, all]"
        read -r ver
        if [ $ver == "2"]
        then
            rm2
        elif [ $ver == "all"]
        then
            rmall
        fi
    elif [ $action == "reinstall"]
    then
        reinstall_py3
    else
        echo "Unsupport action!"
    fi
}

main