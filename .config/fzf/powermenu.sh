#!/usr/bin/env bash

selected="$(echo -e "Shutdown\nReboot\nLock\nLogout" | fzf --no-input --cycle )"
[[ -z "$selected" ]] && exit

case $selected in
  "Shutdown")   systemctl poweroff ;;
  "Reboot")     systemctl reboot ;;
  "Lock")       setsid -f hyprlock -q ;;
  "Logout")     ( [[ -n "$NIRI_SOCKET" ]] && niri msg action quit -s ) || ( [[ -n "$HYPRLAND_INSTANCE_SIGNATURE" ]] && hyprctl dispatch exit ) ;;
esac
kill $PPID
