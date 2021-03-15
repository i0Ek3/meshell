# !/bin/bash

function config_github()
{
	echo "Enter your Github email: "
	read email
	echo "Enter your Github username: "
	read username

	ssh-keygen -t rsa -b 4096 -C "$email"
	eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_rsa
	git config --global user.email "$email"
	git config --global user.name "$username"
}

function main()
{
	echo "Please copy follows SSH key and then paste it into your github SSH setting pages.
	cat ~/.ssh/id_rsb.pub
}

main
