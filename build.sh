#!/bin/bash

CONSUL_VERSION=$1

if [ "" == "${CONSUL_VERSION}" ];then
    echo -e "\033[31mError: CONSUL_VERSION is blank!\033[0m"
    echo -e "\033[33mUse: \"$0 0.9.3\" to build consul rpm.\033[0m"
    exit 1
fi

echo -e "\033[32mClean old files...\033[0m"
rm -f usr/bin/consul
rm -f consul_${CONSUL_VERSION}_linux_amd64.zip

echo -e "\033[32mDownload consul...\033[0m" 
wget https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip
unzip consul_${CONSUL_VERSION}_linux_amd64.zip -d usr/bin
rm -f consul_${CONSUL_VERSION}_linux_amd64.zip
