#!/usr/bin/env bash
# inspired by manilarome/the-glorious-dotfiles

MPD_MUSIC_PATH="/mnt/Data/frank/Music"
TMP_COVER_PATH="/tmp/cover.jpg"
temp_song="/tmp/current-song"
coverExtractingPackage=$(which exiftool)

function Album-Cover-Notif() {
  isDunst=$(command -v dunstify)
  if [ ! -z $isDunst ]
  then
    dunstify --appname 'nmpcpp' --replace 3 --icon $TMP_COVER_PATH "$(mpc -f %title% current)" "$(mpc -f %artist% current)"
  else
    notify-send -i $TMP_COVER_PATH "$(mpc -f %title% current)" "$(mpc -f %artist% current)"
  fi

}

cp "$MPD_MUSIC_PATH/$(mpc --format %file% current)" "$temp_song"

ffmpeg \
    -hide_banner \
    -loglevel 0 \
    -y \
    -i "$temp_song" \
    -vf scale=300:-1 \
    "$TMP_COVER_PATH" > /dev/null 2>&1

rm "$temp_song"

Album-Cover-Notif
