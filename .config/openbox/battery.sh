#!/bin/bash
#
# Openbox menu script for checking laptop battery status.
#
IFS=$'\n' battery=($(upower -i $(upower -e | grep BAT) | grep -E --color=none "state|time|percentage" | tr -s ' ' | cut -f2))
cat << EOF
<openbox_pipe_menu>
  <item label="$(echo ${battery[0]})" />
  <item label="$(echo ${battery[1]})" />
  <item label="$(echo ${battery[2]})" />
</openbox_pipe_menu>
EOF
