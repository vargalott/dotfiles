#!/usr/bin/env bash

if [ -n "$HYPRLAND_INSTANCE_SIGNATURE" ]; then
    exec "$HOME/.config/wofi/menu.sh"
elif [ -n "$NIRI_SOCKET" ]; then
    exec "$HOME/.config/fuzzel/menu.sh"
fi
