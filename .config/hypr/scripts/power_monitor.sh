#!/bin/bash

# Define your hyprctl commands for performance vs saver
function set_performance {

  # Hyprland Visuals: Enable blur, shadows, animations
  hyprctl keyword decoration:blur:enabled true
  hyprctl keyword decoration:drop_shadow true
  hyprctl keyword animations:enabled true

  # Optional: Set refresh rate to max (example for 144hz)
  # hyprctl keyword monitor "eDP-1, 1920x1080@144, 0x0, 1"

  notify-send -u low "Power" "Performance Mode Enabled"
}

function set_saver {
  # Backend: set power profile to power-saver
  powerprofilesctl set power-saver

  # Hyprland Visuals: Disable expensive rendering
  hyprctl keyword decoration:blur:enabled false
  hyprctl keyword decoration:drop_shadow false
  hyprctl keyword animations:enabled false

  # Optional: Cap refresh rate to 60hz to save huge power
  # hyprctl keyword monitor "eDP-1, 1920x1080@60, 0x0, 1"

  notify-send -u critical "Power" "Saver Mode Enabled: Visuals Reduced"
}

# Monitor power state
# acpi_listen waits for events like "ac_adapter AC0 unplugged"
acpi_listen | while read -r event; do
  if [[ "$event" == *"0"* ]]; then
    set_saver
  elif [[ "$event" == *"1"* ]]; then
    set_performance
  fi
done
