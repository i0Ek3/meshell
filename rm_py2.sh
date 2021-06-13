#!/bin/bash

sudo rm -rf "/Library/Frameworks/Python.framework/Versions/2.*"
sudo rm -rf "/Applications/Python\ 2.*"
ls -l /usr/local/bin | grep '../Library/Frameworks/Python.framework/Versions/2.*'
cd /usr/local/bin/ ; ls -l /usr/local/bin | grep '../Library/Frameworks/Python.framework/Versions/2.*' | awk '{print $9}' | tr -d @ | xargs rm
