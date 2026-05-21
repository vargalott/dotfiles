#!/usr/bin/env bash

[[ -n $NIRI_SOCKET ]] && exec $HOME/.config/scripts/fuzzel/applications.menu.sh
[[ -n $HYPRLAND_INSTANCE_SIGNATURE ]] && exec $HOME/.config/scripts/wofi/applications.menu.sh

# kitty -T 'fzf applications' -e $HOME/.config/scripts/fzf/applications.menu.sh
