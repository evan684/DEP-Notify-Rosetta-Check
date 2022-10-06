#!/bin/bash
NOTIFY_LOG="/var/tmp/depnotify.log"
arch=$(/usr/bin/arch)
if [ "$arch" == "arm64" ]; then
    if /usr/bin/pgrep oahd >/dev/null 2>&1; then
        echo "Rosetta 2 already installed."
    else
        /usr/sbin/softwareupdate --install-rosetta --agree-to-license
    fi

elif [ "$arch" == "i386" ]; then
    echo "Status: Intel - Skipping Rosetta" >>$NOTIFY_LOG
else
    echo "Unknown Architecture"
fi