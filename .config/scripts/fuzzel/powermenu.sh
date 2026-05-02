#!/usr/bin/env bash

selected=$( pgrep -x fuzzel >/dev/null 2>&1 || echo -e "Shutdown\nReboot\nLock\nLogout" | \
  fuzzel -d --config ~/.config/fuzzel/powermenu.ini )

case $selected in
  "Shutdown")     systemctl poweroff ;;
  "Reboot")       systemctl reboot ;;
  "Lock")         hyprlock ;;
  "Logout")       niri msg action quit -s ;;
esac
