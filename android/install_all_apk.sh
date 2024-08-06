#!/bin/bash

# 检查 adb 是否安装
if ! command -v adb &> /dev/null
then
    echo "adb could not be found, please install adb first."
    exit 1
fi

# 检查是否有设备连接
if ! adb devices | grep -q "device$"
then
    echo "No Android device found. Please connect your device first."
    exit 1
fi

# 获取当前目录下所有的 .apk 文件
apk_files=$(ls *.apk 2> /dev/null)

# 检查是否存在 .apk 文件
if [ -z "$apk_files" ]
then
    echo "No .apk files found in the current directory."
    exit 1
fi

# 安装每个 .apk 文件
for apk in $apk_files
do
    echo "Installing $apk ..."
    adb install -r "$apk"
    if [ $? -eq 0 ]
    then
        echo "$apk installed successfully."
    else
        echo "Failed to install $apk."
    fi
done

echo "All .apk files processed."
