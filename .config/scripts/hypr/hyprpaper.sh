#!/usr/bin/env bash

killall -q hyprpaper
while pgrep -u $UID -x hyprpaper >/dev/null; do sleep 1; done
hyprpaper
