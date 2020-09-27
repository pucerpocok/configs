#! /bin/bash

rm /tmp/lockpic.png

scrot /tmp/lockpic.png

#convert /tmp/lockpic.png -blur 0x8 /tmp/lockpic.png
mogrify -scale 10% -scale 1000% /tmp/lockpic.png

composite /home/zschmidt/.config/logo -gravity center /tmp/lockpic.png /tmp/lockpic.png

i3lock -i /tmp/lockpic.png
