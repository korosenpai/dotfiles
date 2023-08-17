#!/bin/bash

# Check if any wireless devices are blocked (airplane mode)
if rfkill list wlan | grep -q "blocked: yes"; then
    echo "airplane mode"
fi
