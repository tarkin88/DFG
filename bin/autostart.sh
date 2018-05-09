#!/usr/bin/sh
# |------------------------------------------|
# |             Autostart Config             |
# |         Author: Francisco Suárez         |
# |               April 2018                 |
# |            github: tarkin88              |
# |------------------------------------------|

setxkbmap latam &
dunst &
numlockx on &
betterlockscreen -w &
~/.bin/launch_polybar.sh &
sleep 1s; greenclip daemon &
sleep 2s; compton --config ~/.config/compton/compton.conf  &
sleep 2s; redshift -l "20.6596:-103.3496" -t 6800:4300 -g 0.8 -m vidmode &
sleep 4s; udiskie -aT &
sleep 4s; [ ! -s ~/.config/mpd/pid ] && mpd &
sleep 5s; /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
sleep 5s; xautolock -time 15 -locker 'betterlockscreen --lock dimblur' -notify 10 -notifier "notify-send -u normal -t 10000 -- 'LOCKING screen'" &
