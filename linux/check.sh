#!/bin/bash


bar() {
    echo "----------------------------------"
}

cpu() {
    bar
    grep -i "model name" /proc/cpuinf
    bar
}

gpu() {
    bar
    lspci | grep -i --color "vga\|3d\|2d"
    bar
}

chipset() {
    bar
    dmidecode -t baseboard
    bar
}

keyboard() {
    bar
    dmesg | grep -i input
    bar
}

au() {
    bar
    aplay -l
    bar
}

net() {
    bar
    lspci | grep -i network
    bar
    lshw -class network
    bar
}

drive() {
    bar
    lshw -class disk -class storage
    bar
}

main() {
    cpu
    gpu
    chipset
    keyboard
    au
    net
    drive
}

main
