#!/bin/bash
#
# Install Alacritty, a GPU-accelerated terminal emulator.

readonly SOURCE_DIRECTORY="$(dirname $BASH_SOURCE)"
readonly DESTINATION_DIRECTORY="${HOME}/.config/alacritty"

sudo pacman --sync --noconfirm alacritty

mkdir --parents $DESTINATION_DIRECTORY
ln --force "${SOURCE_DIRECTORY}/alacritty.yml" $DESTINATION_DIRECTORY
