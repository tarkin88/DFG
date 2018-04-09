#!/usr/bin/env bash

Name=$(basename "$0")
Version="0.1"

_usage() {
    cat <<- EOF
Usage:   $Name [options]

Options:
     -h      Display this message
     -v      Display script version
     -q      Persistant calculator dialog
     -w      Switch between open windows
     -r      Program launcher & run dialog
     -c      Select previous clipboard entries
     -b      Browser search by keyword
     -l      Session logout choice

EOF
}

#  Handle command line arguments
while getopts ":hvqwcbrl" opt; do
    case $opt in
        h)
            _usage
            exit 0
            ;;
        v)
            echo -e "$Name -- Version $Version"
            exit 0
            ;;
        r)
            rofi -modi run,drun -show drun -line-padding 4 \
                -columns 2 -padding 50 -hide-scrollbar \
                -show-icons -drun-icon-theme "ArchLabs-Light"
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
            surfraw -browser="$BROWSER" $(sr -elvi | awk -F'-' '{print $1}' \
                | sed '/:/d' | awk '{$1=$1};1' | rofi -hide-scrollbar \
                -kb-row-select 'Tab' -kb-row-tab 'Control+space' \
                -dmenu -mesg 'Tab for Autocomplete' -i -p 'Web Search: ' \
                -padding 50 -line-padding 4)
            ;;
        l)
            ANS=$(echo " Lock| Logout| Reboot| Shutdown" | \
                rofi -sep "|" -dmenu -i -p 'System: ' "" -width 20 \
                -hide-scrollbar -eh 1 -line-padding 4 -padding 20 -lines 4)
            case "$ANS" in
                *Lock) i3lock-fancy ;;
                *Logout) session-logout ;;
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
