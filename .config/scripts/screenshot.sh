#!/usr/bin/env bash
set -euo pipefail

case "${1:-fullscreen}" in
  fullscreen)
    grim - | wl-copy --type image/png ;;

  window)
    g=$(mmsg get focusing-client | jq -r '"\(.x),\(.y) \(.width)x\(.height)"')
    [ -z "$g" ] && exit 1
    grim -g "$g" - | wl-copy --type image/png ;;

  region)
    p=$(mktemp -u).fifo
    mkfifo "$p"
    wayfreeze --after-freeze-timeout 100 --after-freeze-cmd "echo > $p" &
    wp=$!
    trap 'kill "$wp" 2>/dev/null || true; rm -f "$p"' EXIT
    read -r < "$p"
    g=$(slurp -d) || true
    [ -z "$g" ] && exit 1
    grim -g "$g" - | wl-copy --type image/png ;;

  *)
    echo "usage: $0 {fullscreen|window|region}" >&2
    exit 2 ;;
esac
