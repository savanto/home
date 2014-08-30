#
# ~/.xinitrc
#
# To be run whenever an X session starts.

# Setup dual monitors
xrandr --output VGA1 --off --output HDMI2 --mode 1920x1080 --pos 0x0 --rotate normal --output DP2 --off --output DP1 --off --output HDMI1 --mode 1920x1080 --pos 1920x0 --rotate left

# Set keyboard to allow Russian language
setxkbmap -model pc105 -layout us,ru -option grp:shifts_toggle
