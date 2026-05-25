#!/usr/bin/env bash

CURRENT_THEME=$(gsettings get org.gnome.desktop.interface color-scheme | tr -d "'")
case $CURRENT_THEME in
  "prefer-light"|"default")
    # gtk
    gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
    gsettings set org.gnome.desktop.interface gtk-theme "gruvbox-dark"
    gsettings set org.gnome.desktop.interface icon-theme "gruvbox-icons-dark"
    sed -i --follow-symlinks \
      -e "s/^gtk-application-prefer-dark-theme=.*/gtk-application-prefer-dark-theme=1/" \
      -e "s/^gtk-theme-name=.*/gtk-theme-name=gruvbox-dark/" \
      -e "s/^gtk-icon-theme-name=.*/gtk-icon-theme-name=gruvbox-icons-dark/" \
      "$HOME/.config/gtk-3.0/settings.ini" \
      "$HOME/.config/gtk-4.0/settings.ini"
    sed -i --follow-symlinks \
      -e "s/^gtk-theme-name=.*/gtk-theme-name=\"gruvbox-dark\"/" \
      -e "s/^gtk-icon-theme-name=.*/gtk-icon-theme-name=\"gruvbox-icons-dark\"/" \
      "$HOME/.gtkrc-2.0"

    # qt (kvantum)
    kvantummanager --set gruvbox-dark

    # app specific
    ln -sf gruvbox-dark.toml $HOME/.config/alacritty/theme.toml
    ln -sf gruvbox-dark.dunstrc $HOME/.config/dunst/dunstrc
    ln -sf gruvbox-dark.menu.ini $HOME/.config/fuzzel/menu.ini
    ln -sf gruvbox-dark.powermenu.ini $HOME/.config/fuzzel/powermenu.ini
    ln -sf gruvbox-dark.conf $HOME/.config/kitty/theme.conf
    ln -sf gruvbox-dark.kdl $HOME/.config/niri/theme.kdl
    ln -sf gruvbox-dark.css $HOME/.config/waybar/colors.css
    ln -sf gruvbox-dark.css $HOME/.config/wofi/colors.css
  ;;
  "prefer-dark")
    # gtk
    gsettings set org.gnome.desktop.interface color-scheme "prefer-light"
    gsettings set org.gnome.desktop.interface gtk-theme "gruvbox-light"
    gsettings set org.gnome.desktop.interface icon-theme "gruvbox-icons-light"
    sed -i --follow-symlinks \
      -e "s/^gtk-application-prefer-dark-theme=.*/gtk-application-prefer-dark-theme=0/" \
      -e "s/^gtk-theme-name=.*/gtk-theme-name=gruvbox-light/" \
      -e "s/^gtk-icon-theme-name=.*/gtk-icon-theme-name=gruvbox-icons-light/" \
      "$HOME/.config/gtk-3.0/settings.ini" \
      "$HOME/.config/gtk-4.0/settings.ini"
    sed -i --follow-symlinks \
      -e "s/^gtk-theme-name=.*/gtk-theme-name=\"gruvbox-light\"/" \
      -e "s/^gtk-icon-theme-name=.*/gtk-icon-theme-name=\"gruvbox-icons-light\"/" \
      "$HOME/.gtkrc-2.0"

    # qt (kvantum)
    kvantummanager --set gruvbox-light

    # app specific
    ln -sf gruvbox-light.toml $HOME/.config/alacritty/theme.toml
    ln -sf gruvbox-light.dunstrc $HOME/.config/dunst/dunstrc
    ln -sf gruvbox-light.menu.ini $HOME/.config/fuzzel/menu.ini
    ln -sf gruvbox-light.powermenu.ini $HOME/.config/fuzzel/powermenu.ini
    ln -sf gruvbox-light.conf $HOME/.config/kitty/theme.conf
    ln -sf gruvbox-light.kdl $HOME/.config/niri/theme.kdl
    ln -sf gruvbox-light.css $HOME/.config/waybar/colors.css
    ln -sf gruvbox-light.css $HOME/.config/wofi/colors.css
  ;;
  *) ;;
esac

$HOME/.config/scripts/waybar/waybar.sh
kill -SIGUSR1 $(pidof kitty)
