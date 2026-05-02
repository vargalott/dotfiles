#!/usr/bin/env bash

[[ -n "$NIRI_SOCKET" ]] && exec "$HOME/.config/fuzzel/powermenu.sh"
[[ -n "$HYPRLAND_INSTANCE_SIGNATURE" ]] && exec "$HOME/.config/wofi/powermenu.sh"
