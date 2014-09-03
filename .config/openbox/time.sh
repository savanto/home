#!/bin/bash

echo "<openbox_pipe_menu>"
echo "  <item label=\"$(uptime | cut -d' ' -f2)\" />"
echo "</openbox_pipe_menu>"
