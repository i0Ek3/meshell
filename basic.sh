#!/bin/bash
# ref: https://www.sqlsec.com/2022/01/monterey.html


basic() {
    pwpolicy -clearaccountpolicies
    sudo spctl --master-disable
    sudo scutil --set HostName `echo $USER`
    sudo scutil --set ComputerName `echo $USER`
    defaults write com.apple.dock autohide-time-modifier -float 0.5 && killall Dock
    defaults write com.apple.dock autohide-delay -int 0 && killall Dock
    defaults write com.apple.dock springboard-columns -int 9
    defaults write com.apple.dock springboard-rows -int 6
    killall Dock
}

basic
