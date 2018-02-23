#!/usr/bin/env sh
# |------------------------------------------|
# |             Autostart Config             |
# |         Author: Francisco Suárez         |
# |       franksg88 [at] gmail [dot] com     |
# |              January  2018               |
# |                 Tarkin88                 |
# |------------------------------------------|

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch polybar
polybar status_bar &
