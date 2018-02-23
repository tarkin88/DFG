#!/usr/bin/sh
# |------------------------------------------|
# |             Autostart Config             |
# |         Author: Francisco Suárez         |
# |       franksg88 [at] gmail [dot] com     |
# |              January  2018               |
# |                 Tarkin88                 |
# |------------------------------------------|

#xrdb ~/.Xresources &
setxkbmap latam &
dunst &
numlockx on &
nitrogen --restore &
sleep 1s; compton --config ~/.config/compton.conf -cGb &
sleep 1s; ~/.config/polybar/launch_polybar.sh &
sleep 3s; redshift -l "20.6596:-103.3496" -t 6800:4300 -g 0.8 -m vidmode &
sleep 4s; [ ! -s ~/.config/mpd/pid ] && mpd &
sleep 5s; clipit &
sleep 8s; /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
sleep 9s; udiskie -aT &
sleep 10s; dropbox &
#sleep 10s; franz &
