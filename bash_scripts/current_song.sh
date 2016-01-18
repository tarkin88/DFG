#!/usr/bin/sh
# USAGE:
# current_song.sh next
# current_song.sh prev
# current_song.sh toggle

if [ $1 = "next" ]
then
    mpc next
    notify-send  'Now Playing' "$(mpc -f %artist% | head -1) - $(mpc -f %album% | head -1) ($(mpc -f %date% | head -1))   \n  $(mpc -f %title% | head -1) \n $(mpc -f %time% | head -1)"
elif [ $1 = "prev" ]
then
    mpc prev
    notify-send  'Now Playing' "$(mpc -f %artist% | head -1) - $(mpc -f %album% | head -1) ($(mpc -f %date% | head -1))   \n  $(mpc -f %title% | head -1) \n $(mpc -f %time% | head -1)"
elif [ $1 = "toggle" ]
then
    mpc toggle

    notify-send  'Now Playing' "$(mpc -f %artist% | head -1) - $(mpc -f %album% | head -1) ($(mpc -f %date% | head -1))   \n  $(mpc -f %title% | head -1) \n $(mpc -f %time% | head -1)"
fi