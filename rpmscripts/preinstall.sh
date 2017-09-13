getent group consul >/dev/null || groupadd -r consul
getent passwd consul >/dev/null || useradd -r -g consul -d /var/lib/consul -s /sbin/nologin -c "consul user" consul
if [ ! -d /var/lib/consul ]; then 
    mkdir /var/lib/consul
    chown -R consul:consul /var/lib/consul
    chmod -R 0755 /var/lib/consul
fi
