#!/usr/bin/sh

output=$(xrandr -q | grep " connected" | cut -d ' ' -f1)

case "$output" in
        HDMI-1)
            xrandr --output HDMI-1 --auto --right-of eDP-1
            echo "${output} set as principal monitor"
            ;;
         
        eDP-1)
            xrandr --output eDP-1 --auto
            echo "${output} set as principal monitor"
            ;;
         
         DVI-D-1)
            xrandr --output DVI-D-1 --auto
            echo "${output} set as principal monitor"
            ;;
         
        *)
            echo "None monitor detected"
            exit 1
 
esac
