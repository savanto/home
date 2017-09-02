#
# This file is executed by the command interpreter for login shells. It is not
# read by bash(1) if ~/.bash_profile or ~/.bash_login exist.
#
# ~/.profile is traditionally used for setting up the environment, including
# environment variables such as PATH, regardless of shell.
#

# Setup PATH, with custom binary locations taking precedence over system ones.
#
# Host-specific command binaries
PATH="/usr/local/bin"
# Host-specific system binaries
PATH="${PATH}:/usr/local/sbin"
#
# Non-essential command binaries
PATH="${PATH}:/usr/bin"
# Non-essential system binaries
PATH="${PATH}:/usr/sbin"
#
# Essential command binaries
PATH="${PATH}:/bin"
# Essential system binaries
PATH="${PATH}:/sbin"

# Prepend bin directory installed by pip if it exists
[ -d "${HOME}/.local/bin" ] && PATH="${HOME}/.local/bin:${PATH}"
# Prepend bin directory installed by cargo if it exists
[ -d "${HOME}/.cargo/bin" ] && PATH="${HOME}/.cargo/bin:${PATH}"
# Prepend personal bin directory to PATH if it exists
[ -d "${HOME}/bin" ] && PATH="${HOME}/bin:${PATH}"

# Setup environment.
#
# Set default editor
export EDITOR=/usr/bin/vim
#
# Set less utility behavior
export LESSHISTFILE=/dev/null
#
# Start ssh-agent, keep keys for 24 hours.
[ -z $SSH_AGENT_PID ] && SSH_AGENT_PID=$(/bin/pidof ssh-agent)
if [ -z "$SSH_AGENT_PID" ]; then
  eval $(/usr/bin/ssh-agent -s -t 86400)
else
  export SSH_AUTH_SOCK=$(ls -t /tmp/ssh-*/agent.$((SSH_AGENT_PID - 1)) 2>/dev/null | head -1)
  export SSH_AGENT_PID
fi

# Automatically start x when logging in on tty6
[ -z "$DISPLAY" -a "$(/usr/bin/tty)" = /dev/tty6 ] && exec /usr/bin/startx

