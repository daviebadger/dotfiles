#!/bin/bash
#
# Install Ubuntu GNOME, a desktop environment.

readonly LOCAL_DIR="$(dirname $BASH_SOURCE)"

readonly WALLPAPER="wallhaven-j5wd8p_1920x1080.png"
readonly WALLPAPER_URI="file://$(realpath "${LOCAL_DIR}/${WALLPAPER}")"

gsettings set org.gnome.desktop.background picture-uri $WALLPAPER_URI
gsettings set org.gnome.desktop.screensaver picture-uri $WALLPAPER_URI
