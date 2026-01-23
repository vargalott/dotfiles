#!/usr/bin/env bash

pgrep -x fuzzel >/dev/null 2>&1 || fuzzel --config ~/.config/fuzzel/menu.ini
