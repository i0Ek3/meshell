#!/bin/bash

sudo mkdir -p /opt/java
cd ~/Downloads && tar zxvf jdk* && mv jdk*/ jdk
sudo mv jdk /opt/java
sudo ln -s /opt/java/jdk /usr/local/bin/jdk

export JAVA_HOME=/opt/java/jdk > /etc/profile
export CLASSPATH=$JAVA_HOME/lib > /etc/profile
export $PATH:$JAVA_HOME/bin
export PATH JAVA_HOME CLASSPATH
source /etc/profile

java -version
