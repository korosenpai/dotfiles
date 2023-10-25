#!/bin/bash
# open folders saved by neovim telescope projects

projects_file="$HOME/.local/share/nvim/telescope-projects.txt"

# check if project saved or disabled
# active: koro=/home/koro=w0=1=1 -> add in fzf
# deactive: koro=/home/koro=w0=0=1 -> not include
# =1= only 1 in middle is the one we want
folders=$(grep '=1=' $projects_file \
    | awk -F '=' '{ print $2 }') # cut with "=" and get second field


selected=$(echo "$folders" | fzf)
if [ $? -ne 0 ];
then
    echo no projects selected
    exit
fi


cd $selected
# for opening tmux cmd in working dir
# tmux set-option default-path "$PWD"

# default tmux applications
# https://www.sglavoie.com/posts/2018/11/19/tmux-integration-with-vim-neovim-first-steps/#tmux_default_sessionsh


# reverse string, cut by /, get first elem, replace all "." with "_"
session_name=$(echo "$selected" | rev | cut -d "/" -f 1 | rev | sed 's/\./_/g' )

tmux new -s $session_name -d

# if session was created configure it else just enter it
if [ $? -eq 0 ];
then
    echo creating session ...

    # Set up Neovim ready to open files
    tmux send-keys -t "$session_name:0" 'nvim .' Enter

    #tmux rename-window -t "$session_name:0" nvim

    tmux split-window -h
    tmux select-pane -L
fi

# term is to select the correct colorscheme
TERM=screen-256color tmux attach -t $session_name

