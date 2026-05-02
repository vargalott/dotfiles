#!/usr/bin/env bash

selected=$( pgrep -x wofi >/dev/null 2>&1 || echo -e "Shutdown\nReboot\nLock\nLogout" | \
  wofi -i --conf ~/.config/wofi/powermenu.conf --style ~/.config/wofi/style.css )

case $selected in
  "Shutdown")   systemctl poweroff ;;
  "Reboot")     systemctl reboot ;;
  "Lock")       hyprlock ;;
  "Logout")     hyprctl dispatch exit ;;
esac
