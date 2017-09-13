getent group consul >/dev/null || groupadd -r consul
getent passwd consul >/dev/null || useradd -r -g consul -d /var/lib/consul -s /sbin/nologin -c "consul user" consul
