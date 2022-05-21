#!/bin/bash

set_javaenv() {
    platform=$(uname -s)

    if [ $platform == "Darwin" ]
    then
        brew install java
    elif [$platform == "Linux" ]
        sudo apt install -y java
        export JAVA_HOME=/opt/java/jdk > /etc/profile
        export CLASSPATH=$JAVA_HOME/lib > /etc/profile
        export $PATH:$JAVA_HOME/bin
        export PATH JAVA_HOME CLASSPATH
        source /etc/profile

        java -version
    fi
}

set_javaenv