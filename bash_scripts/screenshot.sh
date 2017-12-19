#!/usr/bin/env bash
# |------------------------------------------|
# |             Better Screenshots           |
# |         Author: Francisco Suárez         |
# |       franksg88 [at] gmail [dot] com     |
# |               December 2017              |
# |------------------------------------------|

# script : better screenshots & send a notification

# variables
folder="${HOME}/Imágenes/Screenshots/$(date +"%B-%Y")/"
time=$(date +"%d-%m-%y_%H-%M-%S")

# create a screenshots folder

if ! [[ -d $folder ]]; then
    mkdir -p "$folder"
fi

# function
notify () {
    notify-send 'Saved screenshot'
}

# options
case "$1" in
    "")
        scrot "${folder}/screenshot-${time}.png"
        notify
        ;;
    focused)
        scrot -u "${folder}/screenshot-${time}.png"
        notify
        ;;
    select)
        scrot -s "${folder}/screenshot-${time}.png"
        notify
        ;;
    delay)
        scrot -d 3 "${folder}/screenshot-${time}.png"
        notify
        ;;
    low)
        scrot "${folder}/screenshot-${time}.png"
        notify
        ;;
esac
