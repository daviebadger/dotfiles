#!/usr/bin/env bash

set -eux

cp wallpaper.jpg ~/Pictures

dconf load /com/solus-project/budgie-panel/ < panel.dconf
dconf load /org/gnome/desktop/ <<< $(sed "s/davie/$USER/" desktop.dconf)
dconf load /org/gnome/mutter/ < mutter.dconf
dconf load /org/gnome/settings-daemon/plugins/ < plugins.dconf
