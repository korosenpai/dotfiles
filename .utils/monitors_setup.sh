#!/bin/sh

# TODO: set differeent modes https://www.youtube.com/watch?v=wu2NWw2wPaA&t=220s

fm="eDP"
HOME_sm="HDMI-A-0"

# reset xrandr and make screen equal
#xrandr --output "eDP" --auto --output "HDMI-A-0" --same-as "eDP"


# get list of connected monitors
monitors() {
    xrandr --query | grep '\bconnected\b' | awk '{ print $1 }'
}

n_monitors=$( echo $(monitors) | wc -w )

#TODO: make glava launch based on monitor
echo $n_monitors monitors detected...
case $n_monitors in 
    "1")
        # no monitors connected
        # if there were before now theery are not considered anymore
        xrandr --auto
        ;;

    "2")
        case $(monitors) in
            # if found second monitor start this config
            *$HOME_sm*)
                echo $sm found! running home configuration
                xrandr --output $fm --auto --output $HOME_sm --auto --left-of $fm
                notify-send "connected to $HOME_sm"
                ;;

            *)
                echo "no useful monitor/s found :("
                notify-send "no useful monitor/s found :(" 
                ;;
        esac
        ;;

esac

# set second monitor to the left
#xrandr --output "eDP" --auto --output "HDMI-A-0" --left-of "eDP"
