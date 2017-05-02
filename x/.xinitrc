#!/bin/sh
#
# Personal .xinitrc file, used by all X sessions started by xinit (startx).

# Set keyboard mapping.
/usr/bin/setxkbmap -model pc105 \
  -layout us,ru \
  -option grp:shifts_toggle,grp_led:scroll,compose:ralt

# Set numlock on
/usr/bin/numlockx on
/usr/bin/xset led 1

# Start window manager in-process.
exec i3

