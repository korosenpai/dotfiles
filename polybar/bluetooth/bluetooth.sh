#!/bin/sh
if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]
then
  echo "%{F#66ffffff}󰂲 off"
else
  if [ $(echo info | bluetoothctl | grep 'Device' | wc -c) -eq 0 ]
  then 
    echo " on"
  fi
  # connected to device
  #devicename= $(bluetoothctl devices | cut -f2 -d' ' | while read uuid; do bluetoothctl info $uuid; done|grep -e "Device\|Connected\|Name" | grep "Name:" | cut -d " " -f 2-)
  echo -n " "
  bluetoothctl devices | cut -f2 -d' ' | while read uuid; do bluetoothctl info $uuid; done | grep "Connected: yes" | bluetoothctl info $uuid | grep "Name:" | cut -d " " -f 2-
fi
