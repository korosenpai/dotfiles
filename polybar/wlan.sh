#!/bin/bash

# Check if any wireless devices are blocked (airplane mode)
if rfkill list wlan | grep -q "blocked: yes"; then
    echo "󰀝 airplane"

elif nmcli device status | grep wifi | grep disconnected > /dev/null; then
    echo "󰖪 offline"

else 
    prefix="Auto " # prefix to remove when showing wifi on bar
    ssid=$(nmcli -t -f NAME c show --active | sed -e "s/^$prefix//")
    echo "  $ssid" 

fi
