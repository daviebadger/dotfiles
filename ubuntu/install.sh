#!/usr/bin/env bash

readonly UBUNTU="$(dirname "$0")"
readonly UBUNTU_SETTINGS="${UBUNTU}/settings"

set -eux

cp "${UBUNTU}/wallpaper.jpg" ~/Pictures
rm -f ~/.config/autostart/plank.desktop

dconf load /com/solus-project/budgie-panel/ < "${UBUNTU_SETTINGS}/panel.dconf"
dconf load /org/gnome/desktop/ <<< "$(sed "s/davie/${USER}/" "${UBUNTU_SETTINGS}/desktop.dconf")"
dconf load /org/gnome/mutter/ < "${UBUNTU_SETTINGS}/mutter.dconf"
dconf load /org/gnome/settings-daemon/plugins/ < "${UBUNTU_SETTINGS}/plugins.dconf"
