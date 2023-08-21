#!/usr/bin/env bash

# suspend dunst message display
pkill -u "$USER" -USR1 dunst


PICTURE=/tmp/i3lock.png

BLUR="20x10"

scrot $PICTURE
convert $PICTURE -blur $BLUR $PICTURE 
i3lock -n -i $PICTURE

rm $PICTURE


# resume message display
pkill -u "$USER" -USR2 dunst
