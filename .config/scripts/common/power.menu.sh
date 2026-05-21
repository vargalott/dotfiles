#!/usr/bin/env bash

[[ -n $NIRI_SOCKET ]] && exec $HOME/.config/scripts/fuzzel/power.menu.sh
[[ -n $HYPRLAND_INSTANCE_SIGNATURE ]] && exec $HOME/.config/scripts/wofi/power.menu.sh

# kitty -T 'fzf power' -e $HOME/.config/scripts/fzf/power.menu.sh
