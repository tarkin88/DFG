#!/usr/bin/sh
setxkbmap latam &
xrdb ~/.Xresources
nitrogen --restore &
(sleep 1s && compton --config ~/.config/compton/compton.conf) &
(sleep 1s && pulseaudio --start) &
(sleep 2s && dunst) &
(sleep 3s && mpd ~/.mpd/config) &
(sleep 4s && clipit) &
(sleep 60s && ~/.config/bash_scripts/check_updates.sh ) &