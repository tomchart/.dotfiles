#!/bin/sh
tmux new-session -d
tmux split-window -v
tmux select-pane -t 1
tmux split-window -h
tmux select-pane -t 0
tmux split-window -h
tmux select-pane -t 0
tmux send-keys 'docker container logs trackurls -f' C-m
tmux select-pane -t 1
tmux send-keys 'docker container logs updatestatus -f' C-m
tmux select-pane -t 2
tmux send-keys 'docker container logs deletefiles -f' C-m
tmux select-pane -t 3
tmux send-keys 'docker container logs sendmessages -f' C-m
tmux attach
