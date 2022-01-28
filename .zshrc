#####################
#                   #
# ZSH Configuration #
#                   #
#####################
 
# Path to your oh-my-zsh installation.
export ZSH="/home/tom/.oh-my-zsh"

ZSH_THEME="dracula"

export TERM="xterm-256color"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
    fancy-ctrl-z
    git
    # thefuck       # not working for some reason??
    zsh-autosuggestions
    zsh-syntax-highlighting
    )

source $ZSH/oh-my-zsh.sh

######################
#                    #
# User configuration #
#                    #
######################

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# shh env stuff that doesnt really work lol
SSH_ENV="$HOME/.ssh/agent-environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

# add home folder to pythonpath
# why tf am i doing this instead of using pyenv idk
export PYTHONPATH="${PYTHONPATH}:/home/tom/local/.bin:/home/tom"

# some fzf thing
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# contactme status function with pretty coloured output
function cmstatus() {
	docker ps |
	grep contactme |
	awk '{
		paused=$12;
		if (paused ~ /(Paused)/)
		status="\033[91mPAUSED\033[0m";
		else status="\033[92mLIVE\033[0m";
		print $NF,$9,$10,$11,status
	}'
}

# clear contents of resolv.conf and replace with google dns
# hopefully fixes annoying wsl shit network speed bug
function dns_reset() {
    sudo rm /etc/resolv.conf
    sudo bash -c 'echo "nameserver 8.8.8.8" > /etc/resolv.conf'
    sudo bash -c 'echo "[network]" > /etc/wsl.conf'
    sudo bash -c 'echo "generateResolvConf = false" >> /etc/wsl.conf'
}

# Pretty print the path
alias path='echo $PATH | tr -s ":" "\n"'

# officedata
alias sshv="ssh Version6@10.50.4.97"
# ubuntu
alias s="ssh tom@192.168.48.59 -p 988"

# ls stuff
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# custom funcs
alias cms=cmstatus
alias dns=dns_reset

# contactme pause and unpause
alias cmp='docker pause sendmessages deletefiles trackurls updatestatus > /dev/null;cmstatus'
alias cmu='docker unpause sendmessages deletefiles trackurls updatestatus > /dev/null;cmstatus'

# quickly update and upgrade with no prompting
alias uu="sudo apt update && sudo apt upgrade -y"

# nv4lyf
alias nv="nvim"

# cd aliases
alias d='cd ~/dotfiles/'
alias r='cd ~/reventus/'

# tmux stuff
alias tm="tmux"
alias tma="tmux attach"
alias tmd="tmux detach"
alias cmtm="~/.cmtm.sh"
alias tms="~/dotfiles/./tmux-session-setup.sh"

# helpful to see version in ubuntu (always forget lsb_release)
alias v="lsb_release -a"

cd ~

##################
#                #
# nvm init stuff #
#                #
##################

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
