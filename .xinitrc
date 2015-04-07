#!/bin/sh

# ~/.xinitrc
#
# Personal .xinitrc file, used by all X sessions started by xinit (startx).
# Place configuration lines prior to running the global x session script.

# Setup dual monitors
#/usr/bin/xrandr --output VGA1 --off --output HDMI2 --mode 1920x1080 --rotate normal  --output HDMI1 --mode 1920x1080 --right-of HDMI2 --rotate left

# Set keyboard to allow Russian language
/usr/bin/setxkbmap -model pc105 -layout us,ru -option grp:shifts_toggle

# Set numlock on
/usr/bin/numlockx on
/usr/bin/xset led 1


# Set wallpaper
#[ -e $HOME/.wallpaper ] && [ -x /usr/bin/qiv ] \
#  && qiv -x "$HOME/.wallpaper/$(ls -1 ~/.wallpaper | sort -R | head -1)"

# Start openbox window manager
#/usr/bin/openbox
. /etc/X11/Xsession
