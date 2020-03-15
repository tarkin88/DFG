#!/usr/bin/env sh
# |------------------------------------------|
# |             Polybar launch               |
# |         Author: Francisco Suárez         |
# |            github: tarkin88              |
# |              April  2018                 |
# |------------------------------------------|

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch polybar
polybar main_bar &
