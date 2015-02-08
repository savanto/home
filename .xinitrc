#!/bin/sh

# ~/.xinitrc
#
# Personal .xinitrc file, used by all X sessions started by xinit (startx).
# Place configuration lines prior to running the global x session script.

# Set keyboard to allow Russian language
setxkbmap -model pc105 -layout us,ru -option grp:shifts_toggle

# Set numlock on
/usr/bin/numlockx on
/usr/bin/xset led 1

# invoke global X session script
. /etc/X11/Xsession

