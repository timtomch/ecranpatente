#!/bin/bash
x=60
xdotool mousemove 3000 3000
xdotool search --name Chromium windowactivate %@
xdotool key F5
sleep $x
xdotool search --name feh windowactivate %@