#!/bin/bash

echo "Please run command `sudo vi /etc/ssh/ssh_config` and remove # front of Port 22 line."
sleep 20
sudo vi /etc/ssh/ssh_config
sudo apt install -y openssh-server openssh-client
sudo service ssh restart
