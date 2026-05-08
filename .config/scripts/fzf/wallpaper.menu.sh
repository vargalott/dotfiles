#!/usr/bin/env bash

selected="$(
  find $HOME/Pictures/wallpapers/ -type f 2>/dev/null | \
  fzf --info-command 'echo -e "Wallpapers ($FZF_POS/$FZF_TOTAL_COUNT)"' --cycle --preview-window=right:50% --preview \
  'kitty icat --stdin=no --transfer-mode=memory --clear --align center --scale-up --place=${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}@$((COLUMNS - FZF_PREVIEW_COLUMNS))x0 {}'
)"

[[ -z "$selected" ]] && exit
ln -sf "$selected" $HOME/Pictures/wallpapers/wallpaper.current
$HOME/.config/scripts/hypr/hyprpaper.sh
kill $PPID
