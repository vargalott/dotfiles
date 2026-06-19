#!/usr/bin/env bash
# set -euxo pipefail

CURRENT_THEME=$(gsettings get org.gnome.desktop.interface color-scheme | tr -d "'")
case $CURRENT_THEME in
  "prefer-light"|"default")
    # gtk general
    gsettings set org.gnome.desktop.interface color-scheme  "prefer-dark"
    gsettings set org.gnome.desktop.interface gtk-theme     "gruvbox-dark"
    gsettings set org.gnome.desktop.interface icon-theme    "gruvbox-icons-dark"
    sed -i --follow-symlinks \
      -e "s|^gtk-application-prefer-dark-theme=.*|gtk-application-prefer-dark-theme=1|" \
      -e "s|^gtk-theme-name=.*|gtk-theme-name=gruvbox-dark|" \
      -e "s|^gtk-icon-theme-name=.*|gtk-icon-theme-name=gruvbox-icons-dark|" \
      "$HOME/.config/gtk-3.0/settings.ini" \
      "$HOME/.config/gtk-4.0/settings.ini"
    sed -i --follow-symlinks \
      -e "s|^gtk-theme-name=.*|gtk-theme-name=\"gruvbox-dark\"|" \
      -e "s|^gtk-icon-theme-name=.*|gtk-icon-theme-name=\"gruvbox-icons-dark\"|" \
      "$HOME/.gtkrc-2.0"

    # gtk4
    find $HOME/.config/gtk-4.0/ -maxdepth 1 -type l -delete
    ln -sf $HOME/.local/share/themes/gruvbox-dark/gtk-4.0/assets          $HOME/.config/gtk-4.0/assets
    ln -sf $HOME/.local/share/themes/gruvbox-dark/gtk-4.0/gtk-dark.css    $HOME/.config/gtk-4.0/gtk-dark.css
    ln -sf $HOME/.local/share/themes/gruvbox-dark/gtk-4.0/gtk.css         $HOME/.config/gtk-4.0/gtk.css

    # qt (kvantum)
    sed -i --follow-symlinks \
      -e "s|^icon_theme=.*|icon_theme=gruvbox-icons-dark|" \
      "$HOME/.config/qt5ct/qt5ct.conf" \
      "$HOME/.config/qt6ct/qt6ct.conf"
    kvantummanager --set gruvbox-dark

    # app specific
    ln -sf gruvbox-dark.toml              $HOME/.config/alacritty/theme.toml
    ln -sf gruvbox-dark.theme             $HOME/.config/btop/themes/gruvbox.theme
    ln -sf gruvbox-dark.dunstrc           $HOME/.config/dunst/dunstrc
    ln -sf gruvbox-dark.menu.ini          $HOME/.config/fuzzel/menu.ini
    ln -sf gruvbox-dark.powermenu.ini     $HOME/.config/fuzzel/powermenu.ini
    ln -sf gruvbox-dark.conf              $HOME/.config/kitty/theme.conf
    ln -sf gruvbox-dark.kdl               $HOME/.config/niri/theme.kdl
    ln -sf gruvbox-dark.css               $HOME/.config/waybar/colors.css
    ln -sf gruvbox-dark.toml              $HOME/.config/wayle/themes/theme.toml
    ln -sf gruvbox-dark.css               $HOME/.config/wofi/colors.css
  ;;
  "prefer-dark")
    # gtk general
    gsettings set org.gnome.desktop.interface color-scheme  "prefer-light"
    gsettings set org.gnome.desktop.interface gtk-theme     "gruvbox-light"
    gsettings set org.gnome.desktop.interface icon-theme    "gruvbox-icons-light"
    sed -i --follow-symlinks \
      -e "s|^gtk-application-prefer-dark-theme=.*|gtk-application-prefer-dark-theme=0|" \
      -e "s|^gtk-theme-name=.*|gtk-theme-name=gruvbox-light|" \
      -e "s|^gtk-icon-theme-name=.*|gtk-icon-theme-name=gruvbox-icons-light|" \
      "$HOME/.config/gtk-3.0/settings.ini" \
      "$HOME/.config/gtk-4.0/settings.ini"
    sed -i --follow-symlinks \
      -e "s|^gtk-theme-name=.*|gtk-theme-name=\"gruvbox-light\"|" \
      -e "s|^gtk-icon-theme-name=.*|gtk-icon-theme-name=\"gruvbox-icons-light\"|" \
      "$HOME/.gtkrc-2.0"

    # gtk4
    find $HOME/.config/gtk-4.0/ -maxdepth 1 -type l -delete
    ln -sf $HOME/.local/share/themes/gruvbox-light/gtk-4.0/assets         $HOME/.config/gtk-4.0/assets
    ln -sf $HOME/.local/share/themes/gruvbox-light/gtk-4.0/gtk-dark.css   $HOME/.config/gtk-4.0/gtk-dark.css
    ln -sf $HOME/.local/share/themes/gruvbox-light/gtk-4.0/gtk.css        $HOME/.config/gtk-4.0/gtk.css

    # qt (kvantum)
    sed -i --follow-symlinks \
      -e "s|^icon_theme=.*|icon_theme=gruvbox-icons-light|" \
      "$HOME/.config/qt5ct/qt5ct.conf" \
      "$HOME/.config/qt6ct/qt6ct.conf"
    kvantummanager --set gruvbox-light

    # app specific
    ln -sf gruvbox-light.toml             $HOME/.config/alacritty/theme.toml
    ln -sf gruvbox-light.theme            $HOME/.config/btop/themes/gruvbox.theme
    ln -sf gruvbox-light.dunstrc          $HOME/.config/dunst/dunstrc
    ln -sf gruvbox-light.menu.ini         $HOME/.config/fuzzel/menu.ini
    ln -sf gruvbox-light.powermenu.ini    $HOME/.config/fuzzel/powermenu.ini
    ln -sf gruvbox-light.conf             $HOME/.config/kitty/theme.conf
    ln -sf gruvbox-light.kdl              $HOME/.config/niri/theme.kdl
    ln -sf gruvbox-light.css              $HOME/.config/waybar/colors.css
    ln -sf gruvbox-light.toml             $HOME/.config/wayle/themes/theme.toml
    ln -sf gruvbox-light.css              $HOME/.config/wofi/colors.css
  ;;
  *) ;;
esac

# app reloads
touch $HOME/.config/wayle/config.toml
kill -SIGUSR1 $(pidof kitty)
# kill $(pidof Telegram) && setsid -f Telegram -startintray

# kill $(pidof dunst) && setsid -f dunst
# $HOME/.config/scripts/waybar.sh
# touch $HOME/.config/alacritty/alacritty.toml
