#!/usr/bin/sh
# |------------------------------------------|
# |          Pacman updates checker          |
# |         Author: Francisco Suárez         |
# |       franksg88 [at] gmail [dot] com     |
# |               December 2017              |
# |------------------------------------------|

updates="$(checkupdates | wc -l)"


if [ $updates -gt 0 ]
then
	notify-send  'Updates' "We have $updates new updates"
else
    notify-send  'Updates' "No new updates"
fi



