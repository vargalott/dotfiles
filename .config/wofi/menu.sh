#!/usr/bin/env bash

pgrep -x wofi >/dev/null 2>&1 || wofi --conf ~/.config/wofi/menu.conf --style ~/.config/wofi/style.css --show drun
