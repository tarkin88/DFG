#!/usr/bin/sh
# |------------------------------------------|
# |             Autostart Config             |
# |         Author: Francisco Suárez         |
# |                 Jun 2019                 |
# |            github: tarkin88              |
# |------------------------------------------|

setxkbmap us &
numlockx on &
# xrandr --output eDP1 --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI1 --primary --mode 3440x1440 --pos 1920x0 --rotate normal --output VIRTUAL1 --off;
sleep 1s; betterlockscreen -w &
sleep 1s; greenclip daemon &
sleep 2s; ~/.bin/launch_polybar.sh &
sleep 2s; dunst &
#sleep 2s; ~/.bin/bt-connect.sh &
sleep 3s; compton --config ~/.config/compton/compton.conf &
sleep 4s; udiskie -aT &
sleep 5s; redshift -l "20.671955:-103.416504" -t 6700:3500 -g 0.8 -m vidmode &
#sleep 4s; [ ! -s ~/.config/mpd/pid ] && mpd &
sleep 5s; /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
sleep 10s; xautolock -time 5 -locker 'betterlockscreen --lock dimblur' -notify 10 -notifier "notify-send -u normal -t 10000 -- 'LOCKING screen'" &
