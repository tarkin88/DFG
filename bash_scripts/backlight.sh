#!/usr/bin/sh

print_b=$(notify-send  'Brightness' "$(xbacklight)")

# USAGE:
# backlight.sh up
# backlight.sh down

if [ $1 = "up" ]
then
    xbacklight -inc 10
    $print_b
elif [ $1 = "down" ]
then
    xbacklight -dec 10
    $print_b
fi
