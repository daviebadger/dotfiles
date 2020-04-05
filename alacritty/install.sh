#!/bin/bash
#
# Install Alacritty, a GPU-accelerated terminal emulator.

readonly SOURCE_DIR="$(dirname $BASH_SOURCE)"
readonly DESTINATION_DIR="${HOME}/.config/alacritty"

sudo pacman -S --noconfirm alacritty

mkdir -p $DESTINATION_DIR
ln -f "${SOURCE_DIR}/alacritty.yml" $DESTINATION_DIR
