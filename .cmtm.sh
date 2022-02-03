#!/bin/sh
tmux new-session -d
tmux split-window -v
tmux select-pane -t 2
tmux split-window -h
tmux select-pane -t 1
tmux split-window -h
tmux select-pane -t 1
tmux send-keys 'denv && docker container logs trackurls -f' C-m
tmux select-pane -t 2
tmux send-keys 'denv && docker container logs updatestatus -f' C-m
tmux select-pane -t 3
tmux send-keys 'denv && docker container logs deletefiles -f' C-m
tmux select-pane -t 4
tmux send-keys 'denv && docker container logs sendmessages -f' C-m
tmux attach
