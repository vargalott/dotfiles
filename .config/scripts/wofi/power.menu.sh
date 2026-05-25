#!/usr/bin/env bash

selected=$(
  pgrep -x wofi >/dev/null 2>&1 ||
  ( cd $HOME/.config/wofi && echo -e "Shutdown\nReboot\nLock\nLogout" | wofi -i --conf powermenu.conf --style style.css )
)

case $selected in
  "Shutdown")   systemctl poweroff ;;
  "Reboot")     systemctl reboot ;;
  "Lock")       hyprlock ;;
  "Logout")     hyprctl dispatch exit ;;
esac
