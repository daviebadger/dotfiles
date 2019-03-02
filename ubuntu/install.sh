#!/usr/bin/env bash

readonly UBUNTU="$(dirname "$0")"

set -eux

cp "${UBUNTU}/wallpaper.jpg" ~/Pictures

dconf load /com/solus-project/budgie-panel/ < "${UBUNTU}/panel.dconf"
dconf load /org/gnome/desktop/ <<< "$(sed "s/davie/${USER}/" "${UBUNTU}/desktop.dconf")"
dconf load /org/gnome/mutter/ < "${UBUNTU}/mutter.dconf"
dconf load /org/gnome/settings-daemon/plugins/ < "${UBUNTU}/plugins.dconf"
