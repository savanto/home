#
# This file is executed by bash(1) for interactive login shells. It takes the place of ~/.profile.
#

# Source .profile
[[ -f ~/.profile ]] && . ~/.profile
# Source .bashrc for interactive shells only.
[[ "$-" =~ .*i.* && -f ~/.bashrc ]] && . ~/.bashrc

