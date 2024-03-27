#!/bin/bash
# open folders saved by neovim telescope projects

projects_file="$HOME/.local/share/nvim/telescope-projects.txt"

# check if project saved or disabled
# active: koro=/home/koro=w0=1=1 -> add in fzf
# deactive: koro=/home/koro=w0=0=1 -> not include
# =1= only 1 in middle is the one we want
folders=$(grep '=1=' $projects_file \
    | awk -F '=' '{ print $1 " -> "$2 }') # cut with "=" and get second field


selected=$(echo "$folders" | fzf)
if [ $? -ne 0 ];
then
    echo no projects selected
    exit
fi


cd $(awk -F ' -> ' '{ print $2 }' <<< $selected) # re split to get only path to project
# exec neovim and then exec zsh to keep it open after neovmi exits
gnome-terminal -- sh -c "nvim . ; exec zsh"
# gnome-terminal .
# i3-msg focus left # focus neovim
