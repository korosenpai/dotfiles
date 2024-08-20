#!/bin/bash

mount_disk() {
    sleep_interval=5

    tries=10
    while [ $tries -ge 0 ] 
    do
        echo -n "$tries: " 
        tries=$((tries-1))

        # Check if the 1 exists
        if [ ! -e "$1" ]; then
            echo "Error: Device $1 not found."
            sleep $sleep_interval
            continue
        fi

        # Check if the 1 is already mounted
        if grep -qs '/dev/sda1 ' '/proc/mounts'; then
            echo "1 '$1' is already mounted."
            break
        fi

        # If the 1 is not found or not mounted, proceed with the mount command
        udisksctl mount -b "$1"

        # Check the exit status of the udisksctl command
        if [ $? -ne 0 ]; then
            echo "Error: Mounting $1 failed."
            sleep $sleep_interval
            continue
        fi

        echo "\033[0;32mMounting '$1' successful!\033[0m"
        notify-send "mounted $1"
        break

    done
}



disks=(
    "/dev/sdb1"
    "/dev/sda3"
)

# [@] -> treat each element as word and not space to split element
for disk in "${disks[@]}"
do
    echo $disk;
    mount_disk $disk

done
