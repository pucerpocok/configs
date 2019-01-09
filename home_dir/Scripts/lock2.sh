#! /bin/bash

#scrot /tmp/lockpic.png

#convert /tmp/lockpic.png -blur 0x8 /tmp/lockpic.png
#mogrify -scale 10% -scale 1000% /tmp/lockpic.png

#composite /home/zschmidt/.config/logo -gravity center /tmp/lockpic.png /tmp/lockpic.png

#i3lock -i /tmp/lockpic.png

sh ~/Scripts/notif.sh --disable

termite --title=own_screensaver -e "bash -c \"~/Scripts/start_aquarium.sh\"" &
sleep 1
#i3-msg -t get_tree > /tmp/ooooooo.js
#i3-msg [title="own_screensaver"] fullscreen
i3-msg [title="own_screensaver"] fullscreen global
xtrlock
i3-msg [title="own_screensaver"] kill

sh ~/Scripts/notif.sh --enable
