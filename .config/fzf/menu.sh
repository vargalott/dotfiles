#!/usr/bin/env bash

desktop_file() {
  find /usr/share/applications -name "*.desktop" 2>/dev/null
  find /usr/local/share/applications -name "*.desktop" 2>/dev/null
  find "$HOME/.local/share/applications" -name "*.desktop" 2>/dev/null
  find /var/lib/flatpak/exports/share/applications -name "*.desktop" 2>/dev/null
  find "$HOME/.local/share/flatpak/exports/share/applications" -name "*.desktop" 2>/dev/null
}
selected="$(desktop_file | awk -F/ '{name=$NF; sub(/\.desktop$/, "", name); print name}' | \
  sort -k1,1 | cut -f2- | fzf --info-command 'echo -e "Applications ($FZF_POS/$FZF_TOTAL_COUNT)"' --cycle )"
[[ -z "$selected" ]] && exit
echo "$selected" | while read -r line ; do setsid -f gtk-launch "$(basename $line)"; done
kill $PPID
