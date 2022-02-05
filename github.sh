#!/usr/bin/sh

setpxy() {
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
}

# add hosts for github
add_hosts() {
    # Add follows lines into your hosts.
    echo '199.232.69.194 github.global.ssl.fastly.net' >> /etc/hosts
    echo '140.82.114.4 github.com' >> /etc/hosts
}

# config github profile
config_github() {
	echo "Enter your Github email: "
	read -r email
	echo "Enter your Github username: "
	read -r username

	ssh-keygen -t rsa -b 4096 -C "$email"
	eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_rsa
	git config --global user.email "$email"
	git config --global user.name "$username"

    echo "Please copy follows SSH key and then paste it into your github SSH setting pages."
	cat ~/.ssh/id_rsb.pub
}

main() {
    #setpxy
    add_hosts
    config_github
}

main
