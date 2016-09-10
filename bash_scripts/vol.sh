#!/usr/bin/sh

print_vol=$(notify-send  'Volumen' "$(amixer -c 0 get Master | grep Mono: | cut -d " " -f6)")

# USAGE:
# vol up
# vol down
# vol mute
# vol unmute
# vol 10+
# vol 5-
# vol 60%

if [ $1 = "mute" ]
then
    amixer set Master mute
    notify-send 'Volumen' "Volume muted"
elif [ $1 = "unmute" ]
then
    amixer set Master unmute
    notify-send "Volume unmuted"
elif [ $1 = "up" ]
then
	amixer set Master 5%+ unmute
    $print_vol
elif [ $1 = "down" ]
then
    amixer set Master 5%- unmute
    $print_vol
else
    str=`amixer set Master $1`
	$print_vol
fi
