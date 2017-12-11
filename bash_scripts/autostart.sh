#!/usr/bin/sh
# |------------------------------------------|
# |             Autostart Config             |
# |         Author: Francisco Suárez         |
# |       franksg88 [at] gmail [dot] com     |
# |               December 2017              |
# |											 |
# |------------------------------------------|

setxkbmap latam &
feh --bg-fill ~/.wall.jpg &
dunst &
(sleep 1s && compton --config ~/.config/compton/compton.conf -cGb) &
(sleep 1s && ~/.config/bash_scripts/launch_polybar.sh) &
(sleep 4s && clipit) &
(sleep 5s && ~/.config/bash_scripts/lock.sh -u  ~/.wall.jpg) &
(sleep 5s && ~/.config/bash_scripts/lock.sh -u  -w ) &
(sleep 6s && /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 ) &
(sleep 7s && udiskie -aT ) &
(sleep 10s && xautolock -time 10 -locker ~/.config/bash_scripts/lock.sh -l dimblur) &
(sleep 120 && ~/.config/bash_scripts/check_updates.sh)
