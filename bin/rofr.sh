#!/usr/bin/env bash
# |------------------------------------------|
# |                   Rofr                   |
# |             Author: Archlabs             |
# |        Forked by : Francisco Suárez      |
# |            github: tarkin88              |
# |                April 2018                |
# |------------------------------------------|

Name=$(basename "$0")
Version="0.1"
Develop="archlabs"

_usage() {
    cat <<- EOF
Usage:   $Name [options] by $Develop

Options:
     -h      Display this message
     -v      Display script version
     -q      Persistant calculator dialog
     -w      Switch between open windows
     -r      Program launcher & run dialog
     -c      Select previous clipboard entries
     -b      Screenshots
     -l      Session logout choice

EOF
}

delay() {
    DELAY=$(echo " Lock| Logout| Reboot| Shutdown" | \
        rofi -sep "|" -dmenu -i -p 'Choose a option ' "" -width 20 \
        -hide-scrollbar -eh 1 -line-padding 4 -padding 20 -lines 4)
    case "$ANS" in
        *Lock) betterlockscreen --lock blur ;;
        *Logout) i3-msg exit ;;
        *Reboot) systemctl reboot ;;
        *Shutdown) systemctl poweroff
    esac
}

#  Handle command line arguments
while getopts ":hvqwcbrl" opt; do
    case $opt in
        h)
            _usage
            exit 0
            ;;
        v)
            echo -e "$Name -- Version $Version by $Develop" 
            exit 0
            ;;
        r)r
            rofi -modi run,drun -show drun -line-padding 4 \
               -columns 2 -padding 50 -hide-scrollbar \
               -show-icons -drun-icon-theme "Paper"
            ;;
        w)
            rofi -modi window -show window -hide-scrollbar \
                -eh 1 -padding 50 -line-padding 4
            ;;
        q)
            rofi -modi "calc:qalc +u8 -nocurrencies" -padding 50 \
                -show "calc:qalc +u8 -nocurrencies" -line-padding 4 \
                -hide-scrollbar
            ;;
        c)
            rofi -modi "clipboard:greenclip print" -padding 50 \
                -line-padding 4 -show "clipboard:greenclip print" \
                -hide-scrollbar
            ;;
        b)
            SCREENOPT=$(echo " Full| Area" | \
                rofi -sep "|" -dmenu -i -p 'Choose a option ' "" -width 15 \
                -hide-scrollbar -eh 1 -line-padding 4 -padding 20 -lines 4)
            case "$SCREENOPT" in
                *Full) 
                    DELAY=$(echo "0|3|5|10" | \
                        rofi -sep "|" -dmenu -i -p 'Choose a delay ' "" -width 25 \
                        -hide-scrollbar -eh 1 -line-padding 4 -padding 20 -lines 4)
                    sleep 0.3;scrot '%S.png' -d $DELAY -e 'mv $f $$(xdg-user-dir PICTURES)/Screenshots/screenshot-%d-%m-%y_%H-%M-%S.png'
                    notify-send "Screenshoot $SCREENOPT"
                     ;;
                *Area) 
                    DELAY=$(echo "0|3|5|10" | \
                        rofi -sep "|" -dmenu -i -p 'Choose a delay ' "" -width 25 \
                        -hide-scrollbar -eh 1 -line-padding 4 -padding 20 -lines 4)
                    sleep 0.3;scrot '%S.png' -d $DELAY -s -e 'mv $f $$(xdg-user-dir PICTURES)/Screenshots/screenshot-%d-%m-%y_%H-%M-%S.png'
                    notify-send "Screenshoot $SCREENOPT"
                     ;;
            esac
            ;;
        l)
            ANS=$(echo " Lock| Logout| Reboot| Shutdown" | \
                rofi -sep "|" -dmenu -i -p 'Choose a option ' "" -width 20 \
                -hide-scrollbar -eh 1 -line-padding 4 -padding 20 -lines 4)
            case "$ANS" in
                *Lock) betterlockscreen --lock blur ;;
                *Logout) i3-msg exit ;;
                *Reboot) systemctl reboot ;;
                *Shutdown) systemctl poweroff
            esac
            ;;
        *)
            echo -e "Option does not exist: -$OPTARG"
            _usage
            exit 1
    esac
done
shift $((OPTIND - 1))


exit 0
