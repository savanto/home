#
# ~/.profile
#
# This file is executed by the command interpreter for login shells. It is not
# read by bash(1) if ~/.bash_profile or ~/.bash_login exist.

# ~/.profile is traditionally used for setting up the environment, including
# environment variables such as PATH, regardless of shell.


# Setup PATH, with custom binary locations taking precedence over system ones.
# $HOME/bin:/usr/local/{bin,sbin}:/usr/{bin,sbin}:/{bin,sbin}

# PATH set up to give precedence to packages installed with MacPorts in
# /opt/local, or manually in /usr/local.
#
# MacPorts GNU binaries
[[ -d "/opt/local/libexec/gnubin" ]] && PATH="${PATH}/opt/local/libexec/gnubin:"
# MacPorts command binaries
[[ -d "/opt/local/bin" ]] && PATH="${PATH}/opt/local/bin:"
# MacPorts system binaries
[[ -d "/opt/local/sbin" ]] && PATH="${PATH}/opt/local/sbin:"

# Manually installed command binaries
[[ -d "/usr/local/bin" ]] && PATH="${PATH}/usr/local/bin:"
# Manually installed system binaries
[[ -d "/usr/local/sbin" ]] && PATH="${PATH}/usr/local/sbin:"

# Non-essential command binaries
PATH="${PATH}/usr/bin"
# Non-essential system binaries
PATH="${PATH}:/usr/sbin"

# Essential command binaries
PATH="${PATH}:/bin"
# Essential system binaries
PATH="${PATH}:/sbin"

# Prepend personal bin directory to PATH if it exists
[[ -d "${HOME}/bin" ]] && PATH="${HOME}/bin:${PATH}"


# MANPATH setup to give precedence to packages installed with MacPorts in
# /opt/local, or manually in /usr/local.
#
# MacPorts GNU man pages
[[ -d "/opt/local/libexec/gnubin/man" ]] && \
  MANPATH="${MANPATH}/opt/local/libexec/gnubin/man:"
# MacPorts man pages
[[ -d "/opt/local/share/man" ]] && MANPATH="${MANPATH}/opt/local/share/man:"

# Manually installed man pages
[[ -d "/usr/local/share/man" ]] && MANPAGES="${MANPATH}/usr/local/share/man:"

# System man pages
MANPATH="${MANPATH}/usr/share/man"
