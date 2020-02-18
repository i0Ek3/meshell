#!/usr/bin/sh


# for github to use global proxy with https protocol
git config --global http.https://github.com.proxy https://127.0.0.1:1087
git config --global https.https://github.com.proxy https://127.0.0.1:1087


# for github to use global proxy with socks5 protocol
git config --global http.https://github.com.proxy socks5://127.0.0.1:1086
git config --global https.https://github.com.proxy socks5://127.0.0.1:1086


# increase post buffer
git config --global http.postBuffer 524288000


# unset global proxy
git config --global --unset http.proxy
git config --global --unset https.proxy
