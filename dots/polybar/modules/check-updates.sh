#!/usr/bin/env bash

BAR_ICON=""

while true; do
    count=$(checkupdates | wc -l)
    if hash notify-send &>/dev/null; then
        if [[ $count -gt 50 ]]; then
            notify-send -u critical  \
                        "You really need to update soon!!" "$count New package updates"
        elif [[ $count -gt 25 ]]; then
            notify-send -u normal  \
                        "You should update soon" "$count New package updates"
        elif [[ $count -gt 2 ]]; then
            notify-send -u low \
                        "$count New package updates"
        fi
    fi

    while [[ $count -gt 0 ]]; do
        if [[ $count -eq 1 ]]; then
            echo "$count Update"
        elif [[ $count -gt 1 ]]; then
            echo "$count Updates"
        fi
        sleep 8
        count=$(checkupdates | wc -l)
    done

    while [[ $count -eq 0 ]]; do
        echo $BAR_ICON
        sleep 1200
        count=$(checkupdates | wc -l)
    done
done
