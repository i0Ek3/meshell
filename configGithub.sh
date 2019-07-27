# !/bin/bash

echo "Enter your Github email: "
read email
echo "Enter your Github username: "
read username

ssh-keygen -t rsa -b 4096 -C "$email"
eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_rsa
git config --global user.email "$email"
git config --global user.name "$username"


ecgo "Please go to your github setting page to add SSH key which is under your /home/.ssh/id_rsb.pub"
