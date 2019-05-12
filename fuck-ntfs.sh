#!/bin/bash
# This script will make you mac access the ntfs type external disk directly

# Usage info
usage() {
    cat << EOF
    Usage: ./fuck-ntfs.sh your-ntfs-disk-name
EOF
}

usage
sudo echo 'LABEL=\$1 none ntfs rw,auto,nobrowse' > /etc/fstab.hd
sudo ln -s /Volumes/ ~/Desktop/Udisk
