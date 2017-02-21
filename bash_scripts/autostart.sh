#!/usr/bin/sh
# |------------------------------------------|
# |       Autostart Script for WM (i3)       |
# |         Author: Francisco Suárez         |
# |       franksg88 [at] gmail [dot] com     |
# |       		  January 2017               |
# |------------------------------------------|

setxkbmap latam &
xrdb ~/.Xresources
nitrogen --restore &
(sleep 1s && pulseaudio --start) &
#(sleep 2s && compton -cCzG -t-3 -l-5 -r4 --config /dev/null --backend xrender  --unredir-if-possible) &
(sleep 2s && dunst) &
(sleep 2s && devmon --sync --exec-on-drive "notify-send 'Automount' 'New media detect: $media.'" --exec-on-remove "notify-send 'Automount' '$media has removed.'") &
#(sleep 3s && mpd ~/.mpd/config) &
(sleep 3s && clipit) &
(sleep 3s && compton --config ~/.config/compton/compton.conf) &
(sleep 120s & ~/.config/bash_scripts/check_updates.sh ) &
