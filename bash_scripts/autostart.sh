#!/usr/bin/sh
# |------------------------------------------|
# |             Autostart Config             |
# |         Author: Francisco Suárez         |
# |       franksg88 [at] gmail [dot] com     |
# |               December 2017              |
# |											 |
# |------------------------------------------|

setxkbmap latam &
xrdb ~/.Xresources &
feh --bg-fill ~/.wall.jpg &
dunst &
numlockx on &
(sleep 1s && compton --config ~/.config/compton/compton.conf -cGb) &
(sleep 1s && urxvtd) &
(sleep 2s && ~/.config/bash_scripts/launch_polybar.sh) &
(sleep 4s && [ ! -s ~/.config/mpd/pid ] && mpd) &
(sleep 5s && clipit) &
(sleep 7s && ~/.config/bash_scripts/lock.sh -u  ~/.wall.jpg) &
(sleep 7s && ~/.config/bash_scripts/lock.sh -u  -w ) &
(sleep 8s && /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 ) &
(sleep 9s && udiskie -aT ) &
(sleep 10s &&  xss-lock -- lock -l dimblur) &
(sleep 120 && ~/.config/bash_scripts/check_updates.sh)
