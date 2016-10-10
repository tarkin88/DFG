#!/bin/sh

setxkbmap latam &
xrdb ~/.Xresources
feh --bg-scale  --no-xinerama ~/.dotfiles/walls/wall_black.png
#Wallpaper
(sleep 1s && compton --config ~/.config/compton/compton.conf) &
(sleep 1s && pulseaudio --start) &
#(sleep 2s && tint2) &
(sleep 2s && dunst) &
(sleep 3s && mpd ~/.mpd/config) &
(sleep 4s && clipit) &
#(sleep 4s && conky) &
#(sleep 5s && devmon --sync --exec-on-drive "notify-send 'Automount' '%l is now mounted at %d.'" --exec-on-remove "notify-send 'Automount' '%l has been removed.'") &
(sleep 60s && ~/.config/bash_scripts/check_updates.sh ) &

#exec dbus-launch openbox
exec i3
