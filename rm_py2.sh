#!/bin/bash

sudo rm -rf "/Library/Frameworks/Python.framework/Versions/2.7"
sudo rm -rf "/Applications/Python 2.7"
ls -l /usr/local/bin | grep '../Library/Frameworks/Python.framework/Versions/2.7'
cd /usr/local/bin/ ; ls -l /usr/local/bin | grep '../Library/Frameworks/Python.framework/Versions/2.7' | awk '{print $9}' | tr -d @ | xargs rm
