#!/usr/bin/env bash

pgrep -x wofi >/dev/null 2>&1 || (cd $HOME/.config/wofi && wofi --conf menu.conf --style style.css)
