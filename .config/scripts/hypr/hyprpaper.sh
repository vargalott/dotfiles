#!/usr/bin/env bash

killall -q hyprpaper
while pgrep -u $UID -x hyprpaper >/dev/null; do sleep 0.1; done
setsid -f hyprpaper
