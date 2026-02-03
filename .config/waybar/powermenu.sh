#!/usr/bin/env bash

if [ -n "$HYPRLAND_INSTANCE_SIGNATURE" ]; then
    exec "$HOME/.config/wofi/powermenu.sh"
elif [ -n "$NIRI_SOCKET" ]; then
    exec "$HOME/.config/fuzzel/powermenu.sh"
fi
