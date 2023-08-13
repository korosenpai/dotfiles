#!/bin/sh
if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]
then
  bluetoothctl power on
  notify-send "bluetooth ON"
else
  bluetoothctl power off
  notify-send "bluetooth OFF"
fi
