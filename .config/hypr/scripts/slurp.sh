#!/bin/bash

# 1. Ensure directory exists
DIR="$HOME/Pictures/Screenshots"
mkdir -p "$DIR"

# 2. Define filename
FILENAME="$DIR/$(date +"%d-%m-%Y-%H%M%S")-Slurp.png"

# 3. Get geometry from slurp
# We store the output of slurp in a variable first
GEOM=$(slurp)

# 4. Only run grim if slurp was successful (user didn't hit Escape)
if [ -n "$GEOM" ]; then
  grim -g "$GEOM" "$FILENAME"

  # 5. Check if file exists and notify
  if [ -f "$FILENAME" ]; then
    notify-send "Grim" "Selection Screenshot Saved\n$FILENAME" -i camera-photo
  fi
else
  # Optional: notify that capture was canceled
  notify-send "Grim" "Screenshot canceled" -t 2000
fi
