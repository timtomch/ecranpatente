#!/bin/bash
x=30
xdotool mousemove 3000 3000

# Window 1
xdotool search --name Calendrier windowactivate --sync %@
xdotool key F5
sleep $x

# Window 2
xdotool search --name Ruche windowactivate --sync %@
xdotool key F5
sleep $x

xdotool search --name feh windowactivate %@