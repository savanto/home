#
# ~/.bash_aliases
#
# Bash alias definitions.

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
alias fgrep='grep -F'
alias egrep='grep -E'
alias rgrep='grep -r'
alias psgrep='ps aux | grep'

# dmesg
alias dmesg='dmesg --color=auto'

# sudo (hack to allow sudo with aliases)
alias sudo='sudo '

# apt-get
alias agi='apt-get install --no-install-recommends'
alias agu='apt-get upgrade'
alias agv='apt-get update'
<<<<<<< HEAD
=======
alias agl='apt-get changelog'
alias agc='apt-get changelog'
alias ags='apt-get source'
>>>>>>> 81da5bf... Add aliases
alias acs='apt-cache search'
alias act='apt-cache show'
alias acp='apt-cache policy'

# sqlite3
alias sqlite='sqlite3'
<<<<<<< HEAD

# ps aux
alias psaux='ps aux | grep'

# Check battery
alias batt='upower -i $(upower -e | grep BAT) | grep -E --color=none "state|time|percentage"'
=======
>>>>>>> 81da5bf... Add aliases
