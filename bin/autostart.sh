#!/usr/bin/sh
# |------------------------------------------|
# |             Autostart Config             |
# |         Author: Francisco Suárez         |
# |                 Mar 2020                 |
# |            github: tarkin88              |
# |------------------------------------------|
betterlockscreen -w &
#setxkbmap "us(alt-intl)" &
setxkbmap latam &
numlockx on &
greenclip daemon &
sleep 1s; ~/.bin/launch_polybar.sh &
sleep 2s; dunst &
sleep 3s; picom -b --experimental-backends --dbus --config ~/.config/picom.conf &
sleep 3s; redshift -l "20.671955:-103.416504" -t 7700:4700 -g 0.8 -m vidmode &
# sleep 3s; [ ! -s ~/.config/mpd/pid ] && mpd &
sleep 3s; /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
sleep 4s; udiskie -aT &
sleep 8s; xautolock -time 15 -locker 'betterlockscreen --lock dimblur' -notify 17 -notifier "notify-send -u normal -t 10000 -- 'LOCKING screen'" &
