#!/bin/bash

sudo apt update
sudo apt install -y mysql-server # install
mysql_secure_installation # config
systemctl status mysql.service # boot service
mysqladmin -p -u root version # cat version
mysql -u root -p # login mysql
