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
nitrogen --restore &
~/.bin/launch_polybar.sh &
sleep 1s; compton --config ~/.config/compton.conf -cGb &
sleep 2s; redshift -l "20.6596:-103.3496" -t 6800:4300 -g 0.8 -m vidmode &
sleep 4s; clipit &
sleep 5s; [ ! -s ~/.config/mpd/pid ] && mpd &
sleep 8s; /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
sleep 9s; udiskie -aT &
