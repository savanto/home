#!/bin/bash

# Ships' bells script.
# Version for OSX.
# Use with cron entry:
# 0,30 * * * * /bin/bash /path/to/shipsbells.sh

# Path to {1..8}bells.mp3 files.
BELLSDIR="${HOME}/.local/share/shipsbells"

# Get system volume
vol="$(osascript -e "get volume settings" | cut -d, -f1 | cut -d: -f2)"

if [ "$vol" -ne 0 ]; then
  # Figure out the number of bell to sound based on time.
  time=($(date "+%H %M"))
  nbells=$(echo "(${time[0]} % 4) * 2 + ${time[1]} / 30" | bc)
  # Zero bells equivalent to eight bells.
  [[ "$nbells" -eq 0 ]] && nbells=8
  # Sound bells at appropriate volume.
  afplay -v $(echo "scale=2; 1 / $vol" | bc) ${BELLSDIR}/${nbells}bells.mp3
fi
