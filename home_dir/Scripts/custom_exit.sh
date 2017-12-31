#!/bin/bash

if [ "$1" = "-shutdown" ]; then
    message="Do you really want to shutdown?"
    command="shutdown -h 0"
elif [ "$1" = "-reboot" ]; then
    message="Do you really want to reboot?"
    command="reboot"
elif [ "$1" = "-logout" ]; then
    message="Do you really want to exit i3?"
    command="i3-msg exit"
else
    exit 0
fi

while [ "$select" != "NO" -a "$select" != "YES" ]; do
    select=$(echo -e 'NO\nYES' | rofi -lines 2 -eh 2 -dmenu -p "$message")
    [ -z "$select" ] && exit 0
done
[ "$select" = "NO" ] && exit 0
$command
