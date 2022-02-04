#!/bin/bash

enable_vmnetd() {
    platform=$(uname -s)

    if [ $platform == "Darwin" ]
    then
        sudo launchctl enable system/com.docker.vmnetd
        sudo rm -f /Library/LaunchDaemons/com.docker.vmnetd.plist
        sudo rm -f /Library/PrivilegedHelperTools/com.docker.vmnetd
    else
        echo "Unsupport platform!"
    fi
}

enable_vmnetd