#!/bin/sh

# TODO: set differeent modes https://www.youtube.com/watch?v=wu2NWw2wPaA&t=220s

fm="eDP"
sm="HDMI-A-0"

# reset xrandr and make screen equal
#xrandr --output "eDP" --auto --output "HDMI-A-0" --same-as "eDP"

# if found second monitor start this config
#xrandr --listmonitors | grep $sm

# awk starts from third line (ignores count of monitors and base monitor) and then prints last word -> monitor name
av_monitors=$(xrandr --listmonitors | awk 'NR >= 3 { print $NF }')


case $av_monitors in
    "$sm")
        echo $sm found! running home configuration
        xrandr --output $fm --auto --output $sm --auto --left-of $fm
        notify-send "connected to $sm"
        ;;

    *)
        echo "no useful monitor/s found :("
        ;;
esac

# set second monitor to the left
#xrandr --output "eDP" --auto --output "HDMI-A-0" --left-of "eDP"
