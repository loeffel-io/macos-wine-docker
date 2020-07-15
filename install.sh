#!/bin/bash
set -e

# allow localhost to access xquartz
if ! xhost | grep -q "^INET:localhost$"; then
    echo "WARNING: Adding localhost to authorized xhost clients"
    xhost + 127.0.0.1
fi

# configure xquartz
if [ "$(defaults read org.macosforge.xquartz.X11 app_to_run)" != "/usr/bin/true" ]; then
    defaults write org.macosforge.xquartz.X11 app_to_run /usr/bin/true
fi

if [ "$(defaults read org.macosforge.xquartz.X11 nolisten_tcp)" != "0" ]; then
    defaults write org.macosforge.xquartz.X11 nolisten_tcp 0
fi