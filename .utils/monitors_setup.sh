#!/bin/sh

# TODO: set differeent modes https://www.youtube.com/watch?v=wu2NWw2wPaA&t=220s
# NOTE: can also try and brute force every configuration? commands with monitors not found will just crash

fm="eDP"
sm="HDMI-A-0"

# reset xrandr and make screen equal
#xrandr --output "eDP" --auto --output "HDMI-A-0" --same-as "eDP"

# if found second monitor start this config
# WARN: doesnt display monitor if connected after login
# TODO: find reliable method to detect ALL connected monitors
#xrandr --listmonitors | grep $sm

# get last word from string
last_word() {
    echo $1 | awk '{ print $NF }'
}

n_monitors=$(xrandr --listmonitors | awk 'NR <= 1 { print $NF }')
# awk starts from third line (ignores count of monitors and base monitor) and then prints last word -> monitor name
av_monitors=$(xrandr --listmonitors | awk 'NR >= 3 { print $NF }')

#TODO: make glava launch based on monitor
echo $n_monitors monitors detected...
case $n_monitors in 
    "2")
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

esac

# set second monitor to the left
#xrandr --output "eDP" --auto --output "HDMI-A-0" --left-of "eDP"
