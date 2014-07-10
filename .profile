#
# ~/.profile
#
# This file is executed by the command interpreter for login shells. It is not
# read by bash(1) if ~/.bash_profile or ~/.bash_login exist.

# ~/.profile is traditionally used for setting up the environment, including
# environment variables such as PATH, regardless of shell.


# Setup PATH, with custom binary locations taking precedence over system ones.
# $HOME/bin:/usr/local/{bin,sbin}:/usr/{bin,sbin}:/{bin,sbin}

# NOTE: /usr/local is considered obsolete by the Filesystem Hierarchy Standard.
# Package managers are used to install all packages under /usr, however, if any
# packages are installed by hand, they should go under /usr/local and the
# following locations added to the PATH.
#
# Host-specific command binaries
PATH="/usr/local/bin"
# Host-specific system binaries
PATH="${PATH}:/usr/local/sbin"

# Non-essential command binaries
PATH="${PATH}:/usr/bin"
# Non-essential system binaries
PATH="${PATH}:/usr/sbin"

# Essential command binaries
PATH="${PATH}:/bin"
# Essential system binaries
PATH="${PATH}:/sbin"

# Prepend personal bin directory to PATH if it exists
[ -d "${HOME}/bin" ] && PATH="${HOME}/bin:${PATH}"

# If running x session, configure dual monitors.
[ -n "$XAUTHORITY" ] && [ -e ~/.screenlayout/dual-monitors.sh ] && \
  /bin/bash ~/.screenlayout/dual-monitors.sh
