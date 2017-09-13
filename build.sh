#!/bin/bash

CONSUL_VERSION=$1

if [ "" == "${CONSUL_VERSION}" ];then
    echo -e "\033[31mError: CONSUL_VERSION is blank!\033[0m"
    echo -e "\033[33mUse: \"$0 0.9.3\" to build consul rpm.\033[0m"
    exit 1
fi

echo -e "\033[32mClean old files...\033[0m"
rm -f usr/bin/consul consul_${CONSUL_VERSION}_linux_amd64.zip *.rpm


echo -e "\033[32mDownload consul...\033[0m" 
wget https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip
if [ ! -d usr/bin ]; then mkdir usr/bin; fi
unzip consul_${CONSUL_VERSION}_linux_amd64.zip -d usr/bin
chmod +x usr/bin/consul
rm -f consul_${CONSUL_VERSION}_linux_amd64.zip


echo -e "\033[32mBuilding rpm...\033[0m"
fpm -s dir -t rpm -n "consul" -v ${CONSUL_VERSION} \
    --pre-install rpmscripts/preinstall.sh \
    --post-install rpmscripts/postinstall.sh \
    --pre-uninstall rpmscripts/preuninstall.sh \
    etc usr var
