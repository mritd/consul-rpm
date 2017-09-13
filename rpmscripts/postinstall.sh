if [ $1 -eq 1 ] ; then
    # Initial installation
    systemctl --no-reload preset consul.service >/dev/null 2>&1 || :
fi
