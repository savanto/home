# This file is executed by bash(1) for interactive non-login shells.

# 256 color terminal
export TERM=xterm-256color

# History control.
#
# Do not write lines that begin with a space to the history list.
# Do not write duplicate lines to the history list.
HISTCONTROL=ignoreboth
# Number of lines saved to HISTFILE
HISTFILESIZE=10000
# Number of lines loaded from HISTFILE
HISTSIZE=2000

# Set shell options.
#
# Append the history list to the file named by the value of the HISTFILE
# variable when the shell exits, rather than overwriting the file.
shopt -s histappend
# Do not allow the source (.) builtin to use the value of PATH to find the
# directory containing the file supplied as an argument.
shopt -u sourcepath
# Extended globbing pattern matching.
shopt -s extglob
# Recursive globbing with `**`.
shopt -s globstar
# Check window size after each command and update values of LINES and COLUMNS.
shopt -s checkwinsize

# Set the prompt.
#
if [[ -n "$SSH_CLIENT" || -n "$SSH_TTY" || -n "$SSH_CONNECTION" ]]; then
  user='\[\033[00;33m\]' # yellow
else
  user='\[\033[00;32m\]' # green
fi
path='\[\033[00;34m\]' # blue
reset='\[\033[00m\]'
PS1="${user}\u@\h${reset}:${path}\w${user}\$${reset} "
PROMPT_DIRTRIM=3
unset user path reset

# Setup ls.
#
# Enable the lesspipe filter for less for viewing a wider variety of files.
[[ -x /usr/bin/lesspipe.sh ]] && eval "$(SHELL=/bin/sh lesspipe.sh)"
# Set the colors used by ls.
[[ -f ~/.dircolors ]] && eval "$(dircolors --sh ~/.dircolors)"

# Enable bash completion.
#
if ! shopt -oq posix; then
  [[ -f /etc/bash_completion ]] && . /etc/bash_completion
  if [[ -d ~/.bash_completion.d ]]; then
    for completion in ~/.bash_completion.d/*; do . "$completion"; done
  fi
fi

# Aliases.
#
# ls
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias l1='ls -1'
alias la1='ls -1a'
alias lla='ls -la'
alias lsd='ls -d'
# grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias rgrep='grep -R'
# dmesg
alias dmesg='dmesg --color=auto'
# sudo (hack to allow sudo with aliases)
alias sudo='sudo '
# xsel
alias xsel='xsel -l /dev/null'
# apt-get
alias agi='apt-get install --no-install-recommends'
alias agu='apt-get upgrade -V'
alias agv='apt-get update'
alias agl='apt-get changelog'
alias acs='apt-cache search'
alias act='apt-cache show'
alias acp='apt-cache policy'
# df
alias df='df -h'
# du
alias du='du -h'
# sqlite3
alias sqlite='sqlite3'
# shred
alias shred='shred -zu'
# ps
alias ps='ps -ef'
alias pgrep='pgrep -a'
# ip
alias ip='ip -c'
# ip address
alias ip?='curl https://api.ipify.org/'
# jq
alias jq.="jq -S '.'"
