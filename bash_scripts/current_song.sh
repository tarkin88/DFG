#!/usr/bin/sh
# |------------------------------------------|
# |                 player notify            |
# |         Author: Francisco Suárez         |
# |       franksg88 [at] gmail [dot] com     |
# |               December 2017              |
# |------------------------------------------|
# USAGE:
# current_song.sh next
# current_song.sh prev
# current_song.sh toggle

# options
case "$1" in
    "")
    notify-send  'Now Playing' "$(mpc -f %artist% | head -1) - $(mpc -f %album% | head -1) ($(mpc -f %date% | head -1))   \n  $(mpc -f %title% | head -1) \n $(mpc -f %time% | head -1)"
        ;;
    next)
    mpc next
    notify-send  'Now Playing' "$(mpc -f %artist% | head -1) - $(mpc -f %album% | head -1) ($(mpc -f %date% | head -1))   \n  $(mpc -f %title% | head -1) \n $(mpc -f %time% | head -1)"
        ;;
    prev)
mpc prev
    notify-send  'Now Playing' "$(mpc -f %artist% | head -1) - $(mpc -f %album% | head -1) ($(mpc -f %date% | head -1))   \n  $(mpc -f %title% | head -1) \n $(mpc -f %time% | head -1)"
        ;;
    toggle)
mpc toggle
    notify-send  'Now Playing' "$(mpc -f %artist% | head -1) - $(mpc -f %album% | head -1) ($(mpc -f %date% | head -1))   \n  $(mpc -f %title% | head -1) \n $(mpc -f %time% | head -1)"
        ;;
  
esac
