#!/bin/sh

# TODO: set differeent modes https://www.youtube.com/watch?v=wu2NWw2wPaA&t=220s

# NOTE: env vars are saved in etc/profile.d/monitors.sh


# reset xrandr and make screen equal
#xrandr --output "eDP" --auto --output "HDMI-A-0" --same-as "eDP"


# get list of connected monitors
monitors=$( xrandr --query | grep '\bconnected\b' | awk '{ print $1 }' )
#main_monitor=$( echo $monitors | awk '{ print $1 }'  )

n_monitors=$( echo $monitors | wc -w )

notify-send "monitors: $n_monitors"
case $n_monitors in 
    "1")
        # no monitors connected
        # if there were before now theery are not considered anymore
        xrandr --auto

        #TODO: make glava launch based on monitor
        #$HOME/.config/glava/launch.sh &
        ;;

    "2")
        case $monitors in
            # if found second monitor start this config
            *$HOME_SM*)
                xrandr --output $FM --auto --output $HOME_SM --auto --left-of $FM
                notify-send "connected to $HOME_SM"
                ;;

            *)
                notify-send "no configured monitor/s found :(" 
                ;;
        esac
        ;;

esac

# set second monitor to the left
#xrandr --output "eDP" --auto --output "HDMI-A-0" --left-of "eDP"
