#!/bin/bash
echo "Deprecated!"
sleep 10

echo "-------------------------------Only Linux----------------------------------"
echo " "
echo "This script will flash ubuntu touch 16.04 on your device which you given."
echo "There are some devices aviaiable:"
echo "  -bacon(Oneplus One)"
echo "  -hammerhead(Google Nexus 5)"
echo "  -flo(Google Nexus 7 2013 Wifi)"
echo "  -mako(Google Nexus 4)"
echo "  -shamu(Google Nexus 6)"
echo "   ...."
echo "And other devices you can check this site: http://system-image.ubports.com."
echo "Now I defalut you understand our items,let we go!"
echo " "
echo "-------------------------------Good Luck-----------------------------------"
sleep 5

echo "Enter your device code: "
read code

echo "Installing tools..."
sudo apt install android-tools-adb android-tools-fastboot ubuntu-device-flash

echo "Flashing now..."
sudo ubuntu-device-flash --server=http://system-image.ubports.com touch --device=$code --channel=ubports-touch/16.04/devel --bootstrap --wipe
