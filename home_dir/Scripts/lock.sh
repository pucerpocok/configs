#! /bin/bash

scrot /tmp/lockpic.png

convert /tmp/lockpic.png -blur 0x5 /tmp/lockpic.png

composite /home/zschmidt/.config/logo -gravity center /tmp/lockpic.png /tmp/lockpic.png

i3lock -i /tmp/lockpic.png
