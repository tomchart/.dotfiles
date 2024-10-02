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

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#####################
#                   #
# ZSH Configuration #
#                   #
#####################
 
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export LESS="-SRXF"

ZSH_THEME="powerlevel10k/powerlevel10k"

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

# add home folder to pythonpath
# why tf am i doing this instead of using pyenv idk
export PYTHONPATH="${PYTHONPATH}:$HOME/local/.bin:$HOME"

# some fzf thing
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# clear contents of resolv.conf and replace with google dns
# hopefully fixes annoying wsl shit network speed bug
dns_reset() {
    sudo rm /etc/resolv.conf
    sudo bash -c 'echo "nameserver 8.8.8.8" > /etc/resolv.conf'
    sudo bash -c 'echo "[network]" > /etc/wsl.conf'
    sudo bash -c 'echo "generateResolvConf = false" >> /etc/wsl.conf'
}

octal_folder_perms() {
    stat -c "%a %n" $1
}

##################
#                #
#     alias      #
#                #
##################

# quickly update and upgrade with no prompting
alias uu="sudo apt update && sudo apt upgrade -y"
# nvim
alias nv="nvim"
# helpful to see version in ubuntu (always forget lsb_release)
alias v="lsb_release -a"
# Pretty print the path
alias path='echo $PATH | tr -s ":" "\n"'
# see octal permission for folder
alias oct=octal_folder_perms
# cd
alias d='cd ~/dotfiles/'
alias o='cd /opt/lampp/htdocs/oms-V1.4/'
alias s="cd ~/scratch"
# tmux
alias tmux="/usr/local/bin/tmux"
alias tm="tmux"
alias tma="tmux attach"
alias tmd="tmux detach"
alias tms="~/dotfiles/./tmux-session-setup.sh"
# ls
alias ll='exa -alF --group-directories-first'
alias lt='exa -lFT --group-directories-first'
alias la='exa -alFT --group-directories-first'
alias l='exa'
# php
export PATH="/Users/tom/.composer/vendor/bin:$PATH"
# xampp/lampp service up/down
alias xup='sudo /opt/lampp/lampp start'
alias xdown='sudo /opt/lampp/lampp stop'
# git
alias oops="gau && gcn!"
# heh
alias terror="tail /opt/lampp/logs/php_error_log -f"
# mycli
alias mc="mycli -u root -D oms"

##################
#                #
# nvm init stuff #
#                #
##################

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

##################
#                #
#   pyenv init   #
#                #
##################
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init --path)"
# eval "$(pyenv init -)"


##################
#                #
#     p10k       #
#                #
##################
# source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
