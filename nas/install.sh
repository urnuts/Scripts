#!/bin/sh

if [ -e "./powerbutton-7.0-apollolake.tar" ]; then tar xf ./powerbutton-7.0-apollolake.tar -C /;fi
if [ -e "./powerbutton-7.0-bromolow.tar" ]; then tar xf ./powerbutton-7.0-bromolow.tar -C /;fi

/usr/local/etc/rc.d/S30acpid.sh start

exit 0
