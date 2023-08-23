#!/bin/sh

# TODO: set differeent modes https://www.youtube.com/watch?v=wu2NWw2wPaA&t=220s

fm="eDP"
sm="HDMI-A-0"

# reset xrandr and make screen equal
#xrandr --output "eDP" --auto --output "HDMI-A-0" --same-as "eDP"

# if found second monitor start this config
xrandr --listmonitors | grep $sm

# set second monitor to the left
#xrandr --output "eDP" --auto --output "HDMI-A-0" --left-of "eDP"
