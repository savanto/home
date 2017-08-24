#!/bin/sh
#
# Personal .xinitrc file, used by all X sessions started by xinit (startx).

# Set keyboard mapping.
/usr/bin/setxkbmap -model pc105 \
  -layout us,ru \
  -option grp:shifts_toggle \
  -option grp_led:scroll \
  -option compose:menu \
  -option terminate:ctrl_alt_bksp

# Set keyboard options.
/usr/bin/numlockx on
/usr/bin/xset led 1 # Numlock led
/usr/bin/xset r rate 300 30 # Key repeat delay (ms) and rate (/sec)

[ -f ~/.config/monitors ] && sh ~/.config/monitors

# Start window manager in-process.
exec i3

