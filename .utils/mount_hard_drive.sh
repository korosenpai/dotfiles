#!/bin/sh

# list of drives
#lsblk

# https://unoix.stackexchange.com/questions/686838/mount-usb-drive-without-sudo
#udisksctl mount -b /dev/sda1 | grep asd


# check if command succeeded or failed
#ls -l /media/koro/Hardisk && echo "Command succeeded" || echo "Command failed"
#echo $?

device="/dev/sda1"
sleep_interval=5

tries=10
while [ $tries -ge 0 ] 
do
    echo -n "$tries: " 
    tries=$((tries-1))

    # Check if the device exists
    if [ ! -e "$device" ]; then
        echo "Error: Device $device not found."
        sleep $sleep_interval
        continue
    fi

    # Check if the device is already mounted
    if grep -qs '/dev/sda1 ' '/proc/mounts'; then
        echo "device '$device' is already mounted."
        exit 0
    fi

    # If the device is not found or not mounted, proceed with the mount command
    udisksctl mount -b "$device"

    # Check the exit status of the udisksctl command
    if [ $? -ne 0 ]; then
        echo "Error: Mounting $device failed."
        sleep $sleep_interval
        continue
    fi

    echo "\033[0;32mMounting successful!\033[0m"
    notify-send "mounted $device"
    break

done


