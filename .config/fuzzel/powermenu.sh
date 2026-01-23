#!/usr/bin/env bash

command=$( echo -e "Shutdown\nReboot\nLock\nLogout" | fuzzel -d --config ~/.config/fuzzel/powermenu.ini )
case $command in
    "Shutdown")
        systemctl poweroff
        ;;
    "Reboot")
        systemctl reboot
        ;;
    "Lock")
        hyprlock
        ;;
    "Logout")
        niri msg action quit -s
        ;;
    *)
        ;;
esac
