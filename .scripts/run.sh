#!/bin/bash

# NOTE: utility to run using dmenu any sh file present in the dir

# accepts one argument as folder where to run in
# if no arguments or argument is not a good folder default to this one
[ -d "$1" ] && cd "$1" || cd "$(dirname "$0")"


# execute any bash file chosen
# awk is to remove "./" from all starting strings
find . -maxdepth 1 -type f -executable \
    | awk '{print substr($0, 3)}' \
    | rofi -dmenu \
        -no-fixed-num-lines \
        -config "$HOME/.config/rofi/themes/gruvbox.rasi" | xargs bash

