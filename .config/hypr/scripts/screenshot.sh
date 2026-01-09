#!/bin/bash

# Ensure the directory exists
DIR="$HOME/Pictures/Screenshots"
mkdir -p "$DIR"

# Define filename
NAME="$DIR/$(date +"%d-%m-%Y-%H%M%S")-Full.png"

# Execute grim (standard PNG output)
grim "$NAME"

# Check if file was created and notify
if [ -f "$NAME" ]; then
  notify-send "Screenshot Saved" "$NAME" -i camera-photo
else
  notify-send "Error" "Screenshot failed to save"
fi
