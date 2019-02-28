#!/usr/bin/env bash

set -eux

cp wallpaper.jpg ~/Pictures

dconf load /com/solus-project/ < panel.dconf
dconf load /org/gnome/mutter/ < windows.dconf
dconf load /org/gnome/settings-daemon/plugins/ < plugins.dconf
