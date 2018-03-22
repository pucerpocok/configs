#!/bin/bash

win_name=$(xdotool getwindowfocus getwindowname)
if [[ $win_name =~ "VirtualBox" ]]; then
    echo "%{F#f00}VirtualBox%{F-}"
else
    echo
fi
