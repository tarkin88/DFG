#!/usr/bin/sh
# |------------------------------------------|
# |             Autostart Config             |
# |         Author: Francisco Suárez         |
# |                 Mar 2020                 |
# |            github: tarkin88              |
# |------------------------------------------|

numlockx on &
betterlockscreen -w &
greenclip daemon &
sleep 1s; ~/.bin/launch_polybar.sh &
sleep 2s; dunst &
#sleep 2s; ~/.bin/bt-connect.sh &
sleep 3s; picom -b --experimental-backends --dbus --config ~/.config/picom.conf &
sleep 5s; redshift -l "20.671955:-103.416504" -t 6700:3500 -g 0.8 -m vidmode &
#sleep 4s; [ ! -s ~/.config/mpd/pid ] && mpd &
sleep 5s; /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
sleep 6s; udiskie -aT &
sleep 10s; xautolock -time 10 -locker 'betterlockscreen --lock dimblur' -notify 10 -notifier "notify-send -u normal -t 10000 -- 'LOCKING screen'" &
