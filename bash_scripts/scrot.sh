#!/usr/bin/sh

#if [ -n "$1" ];
#    then k=${1}
#   else k=3
#fi
#echo -n 'Taking shot in '
#while [ $k -gt 0 ]
#do echo -n "$k..."
#k=$(($k - 1))
#sleep 1
#done
#k=$(date +%d%m%y_%H%M)
#imlib2_grab ~/screenshoot_$k.png
scrot -s
notify-send 'Scrot' "Saved as $HOME/screenshoot_$k.png"
