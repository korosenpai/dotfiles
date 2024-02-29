#!/bin/bash

# get man of every command and view it in zathura

man -k . | dmenu -l 30 | awk '{print $1}' | xargs -r man -Tpdf | zathura -

#alias shman="compgen -c . | fzf | xargs tldr" # show tldr of every command
#alias fman="man -k . | fzf | xargs man" # get manual of every command with man entry

