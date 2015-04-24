#!/bin/sh

# ~/.xinitrc
#
# Personal .xinitrc file, used by all X sessions started by xinit (startx).
# Place configuration lines prior to running the global x session script.

# Set keyboard to allow Russian language
/usr/bin/setxkbmap -model pc105 -layout us,ru -option grp:shifts_toggle

. /etc/X11/Xsession
