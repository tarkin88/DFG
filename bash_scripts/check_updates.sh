#!/usr/bin/sh
updates="$(checkupdates | wc -l)"


if [ $updates -gt 0 ]
then
	notify-send  'Updates' "We have $updates new updates"
else
    notify-send  'Updates' "No new updates"
fi



