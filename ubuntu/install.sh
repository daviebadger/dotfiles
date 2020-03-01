#!/bin/bash
#
# Install Ubuntu GNOME, a desktop environment.

readonly LOCAL_DIR="$(dirname $BASH_SOURCE)"

readonly WALLPAPER="wallhaven-j5wd8p_1920x1080.png"
readonly WALLPAPER_URI="file://$(realpath "${LOCAL_DIR}/${WALLPAPER}")"

gsettings set org.gnome.desktop.background picture-uri $WALLPAPER_URI
gsettings set org.gnome.desktop.screensaver picture-uri $WALLPAPER_URI

exit 0

readonly UBUNTU="$(dirname "$0")"
readonly UBUNTU_SETTINGS="${UBUNTU}/settings"

set -eux

rm -f ~/.config/autostart/plank.desktop

dconf load /com/solus-project/budgie-panel/ < "${UBUNTU_SETTINGS}/panel.dconf"
dconf load /org/gnome/desktop/ <<< "$(sed "s/davie/${USER}/" "${UBUNTU_SETTINGS}/desktop.dconf")"
dconf load /org/gnome/mutter/ < "${UBUNTU_SETTINGS}/mutter.dconf"
dconf load /org/gnome/settings-daemon/plugins/ < "${UBUNTU_SETTINGS}/plugins.dconf"

dconf reset -f /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/budgie-tilix-quake1/
dconf reset -f /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/budgie-tilix-quake2/
