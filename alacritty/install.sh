#!/bin/bash
#
# Install Alacritty, a GPU-accelerated terminal emulator.

readonly SOURCE_DIR="$(dirname $BASH_SOURCE)"
readonly DESTINATION_DIR="$HOME/.config/alacritty"

sudo add-apt-repository --yes ppa:mmstick76/alacritty
sudo apt update
sudo apt install --yes alacritty

sudo update-alternatives --set x-terminal-emulator /usr/bin/alacritty

mkdir -p $DESTINATION_DIR
ln -f "${SOURCE_DIR}/alacritty.yml" $DESTINATION_DIR
