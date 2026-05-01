#!/usr/bin/env bash

selected="$(echo -e "Shutdown\nReboot\nLock\nLogout" | fzf --no-input --cycle )"
[[ -z "$selected" ]] && exit

case $selected in
  "Shutdown")
    systemctl poweroff
    ;;
  "Reboot")
    systemctl reboot
    ;;
  "Lock")
    setsid -f hyprlock -q
    ;;
  "Logout")
    niri msg action quit -s
    ;;
  *)
    ;;
esac
kill $PPID
