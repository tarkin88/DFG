#!/usr/bin/env bash

Name=$(basename "$0")
Version="0.1"
_usage() {
    cat <<EOF

 USAGE:
        $Name [OPTIONS] [ADDITIONAL]

 OPTIONS:
      -h,--help         Display this message
      -v,--version      Display script version
      -t,--terminal     Toggle a floating work terminal, no additional options
      -p,--polybar      Toggle the configured polybar session, no additional options
      -c,--compton      Toggle compton or daemon monitoring icon, can use toggle option
      -r,--redshift     Toggle redshift or daemon monitoring icon, can use toggle option
      -f,--autolock     Toggle Xautolock or daemon monitoring icon, can use toggle option

 ADDITIONAL:
      -tg,--toggle      Toggle the program off/on, without this flag a monitor process will be started

EOF
}


toggle_terminal() {
    if pgrep --full "termite --title=Work --class=Work" &>/dev/null; then
        pkill --full "termite --title=Work --class=Work"
    else
        termite --title=Work --class=Work &
    fi
}


toggle_polybar() {
    if [[ $(pidof polybar) ]]; then
        pkill polybar
    else
        al-polybar-session
    fi
}


toggle_compton() {
    if [[ $opt -eq 1 ]]; then
        if [[ $(pidof compton) ]]; then
            al-compositor --stop
        else
            al-compositor --start
        fi
        exit 0
    fi
    on=""
    off=""
    while true; do
        if [[ $(pidof compton) ]]; then
            echo "$on"
        else
            echo "%{F#888888}$off"
        fi
        sleep 2
    done
}


toggle_redshift() {
    if [[ $opt -eq 1 ]]; then
        if [[ $(pidof redshift) ]]; then
            pkill redshift
        else
            redshift &
        fi
        exit 0
    fi
    icon=""
    while true; do
        if [[ $(pidof redshift) ]]; then
            temp=$(sed 's/K//g' <<< "$(grep -o '[0-9].*K' <<< "$(redshift -p 2>/dev/null)")")
        fi
        if [[ -z $temp ]]; then
            echo " $icon "                # Greyed out (not running)
        elif [[ $temp -ge 5000 ]]; then
            echo "%{F#8039A0} $icon "     # Blue
        elif [[ $temp -ge 4000 ]]; then
            echo "%{F#F203F0} $icon "     # Yellow
        else
            echo "%{F#FF5B6C} $icon "     # Orange
        fi
        sleep 2
    done
}


toggle_xautlock() {
    if [[ $opt -eq 1 ]]; then
        if [[ $(pgrep -x "xautolock") ]]; then
            xset dpms 0 0 0
            xautolock -exit
        else
            xautolock -time 15 -locker 'betterlockscreen --lock dimblur' -notify 10 -notifier "notify-send -u normal -t 10000 -- 'LOCKING screen'"  &
            xset dpms 900 900 900
        fi
        exit 0
    fi

    while true; do
        if [[ $(pgrep -x "xautolock") ]]; then
            echo "%{F#E8DFD6} off "
        else
            echo "%{FCOLOR} on "
        fi
        sleep 2
    done
}


# Catch command line options
case $1 in
    -t|--terminal)
        toggle_terminal
        ;;
    -p|--polybar)
        toggle_polybar
        ;;
    -c|--compton)
        case $2 in
            -tg|--toggle)
                opt=1
        esac
        toggle_compton
        ;;
    -r|--redshift)
        case $2 in
            -tg|--toggle)
                opt=1
        esac
        toggle_redshift
        ;;
    -f|--xautolock)
        case $2 in
            -tg|--toggle)
                opt=1
        esac
        toggle_xautlock
        ;;
    -h|--help)
        _usage
        ;;
    -v|--version)
        echo -e "$Name -- Version $Version"
        ;;
    *)
        echo -e "Option does not exist: $1" && _usage && exit 1
esac

exit 0
