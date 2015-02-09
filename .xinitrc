#!/bin/sh

# ~/.xinitrc
#
# Personal .xinitrc file, used by all X sessions started by xinit (startx).
# Place configuration lines prior to running the global x session script.

# Setup dual monitors
#xrandr --output VGA1 --off --output HDMI2 --mode 1920x1080 --pos 0x0 --rotate normal --output DP2 --off --output DP1 --off --output HDMI1 --mode 1920x1080 --pos 1920x0 --rotate left

# Set keyboard to allow Russian language
setxkbmap -model pc105 -layout us,ru -option grp:shifts_toggle

# Set numlock on
/usr/bin/numlockx on
/usr/bin/xset led 1

# Set wallpaper
[[ -e ~/.wallpaper ]] \
  && which qiv 2>/dev/null \
  && qiv -x "$(ls -1 ~/.wallpaper | sort -R | head -1)"

# invoke global X session script
. /etc/X11/Xsession

