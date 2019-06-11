#!/usr/bin/sh
# |------------------------------------------|
# |             Autostart Config             |
# |         Author: Francisco Suárez         |
# |                 Jun 2019                 |
# |            github: tarkin88              |
# |------------------------------------------|

setxkbmap latam &
numlockx on &
sleep 1s; greenclip daemon &
sleep 2s; ~/.bin/launch_polybar.sh &
sleep 2s; betterlockscreen -w &
sleep 2s; dunst &
sleep 2s; ~/.bin/bt-connect.sh &
sleep 3s; compton --config ~/.config/compton/compton.conf &
sleep 4s; udiskie -aT &
sleep 5s; redshift -l "20.6596:-103.3496" -t 6800:4300 -g 0.8 -m vidmode &
#sleep 4s; [ ! -s ~/.config/mpd/pid ] && mpd &
sleep 5s; /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
sleep 10s; xautolock -time 5 -locker 'betterlockscreen --lock dimblur' -notify 10 -notifier "notify-send -u normal -t 10000 -- 'LOCKING screen'" &

