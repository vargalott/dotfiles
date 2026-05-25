#!/usr/bin/env bash

CURRENT_THEME=$(gsettings get org.gnome.desktop.interface color-scheme | tr -d "'")
case $CURRENT_THEME in
  "prefer-light"|"default")
    # gtk
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    gsettings set org.gnome.desktop.interface gtk-theme "gruvbox-dark"
    sed -i --follow-symlinks \
      -e 's/^gtk-theme-name=.*/gtk-theme-name=gruvbox-dark/' \
      -e 's/^gtk-application-prefer-dark-theme=.*/gtk-application-prefer-dark-theme=1/' \
      "$HOME/.config/gtk-3.0/settings.ini" \
      "$HOME/.config/gtk-4.0/settings.ini"
    sed -i --follow-symlinks \
      -e 's/^gtk-theme-name=.*/gtk-theme-name="gruvbox-dark"/' \
      "$HOME/.gtkrc-2.0"

    # qt (kvantum)
    kvantummanager --set gruvbox-dark
  ;;
  "prefer-dark")
    # gtk
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
    gsettings set org.gnome.desktop.interface gtk-theme "gruvbox-light"
    sed -i --follow-symlinks \
      -e 's/^gtk-theme-name=.*/gtk-theme-name=gruvbox-light/' \
      -e 's/^gtk-application-prefer-dark-theme=.*/gtk-application-prefer-dark-theme=0/' \
      "$HOME/.config/gtk-3.0/settings.ini" \
      "$HOME/.config/gtk-4.0/settings.ini"
      sed -i --follow-symlinks \
        -e 's/^gtk-theme-name=.*/gtk-theme-name="gruvbox-light"/' \
        "$HOME/.gtkrc-2.0"

    # qt (kvantum)
    kvantummanager --set gruvbox-light
  ;;
  *) ;;
esac
