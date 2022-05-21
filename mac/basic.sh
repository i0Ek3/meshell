#!/bin/bash
# ref: https://www.sqlsec.com/2022/01/monterey.html


basic() {
    pwpolicy -clearaccountpolicies
    sudo spctl --master-disable

    sudo scutil --set HostName `echo $USER`
    sudo scutil --set ComputerName `echo $USER`

    defaults write com.apple.desktopservices DSDontWriteNetworkStores true

    echo "Would you like [set] or [restore] your dock?"
    read -r operation
    if [ $operation == "set" ]
    then
        defaults write com.apple.dock springboard-columns -int 9 
        defaults write com.apple.dock springboard-rows -int 6
	    defaults write com.apple.dock autohide-time-modifier -float 0.5
	    defaults write com.apple.dock autohide-delay -int 0
        killall Dock     
    elif [ $operation == "restore" ]
    then
        defaults delete com.apple.dock autohide-time-modifier
	    defaults delete com.apple.Dock autohide-delay
        killall Dock
    else
        echo "Wrong input!"
    fi
}

basic