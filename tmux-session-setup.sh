#!/bin/bash

SESSION='reventus'

# starts new session with three windows:
  # 1) local
  # 2) ubuntu
  # 3) sshv

  if [ "$(tmux list-sessions 2> /dev/null | grep -o $SESSION)" != "$SESSION" ]; then

    tmux new-session -d -s $SESSION 

    tmux rename-window 'local'
    tmux new-window -a -t $SESSION -n 'ubuntu'
    tmux new-window -a -t $SESSION -n 'sshv' 

    tmux send -t $SESSION:local screenfetch ENTER
    tmux send -t $SESSION:ubuntu s 
    tmux send -t $SESSION:sshv sshv 

    sleep 1
    tmux attach -t $SESSION:local

  else
    tmux attach -t $SESSION
  fi
