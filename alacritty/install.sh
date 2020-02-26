#!/bin/bash
#
# Install Alacritty, a GPU-accelerated terminal emulator.

readonly LOCAL_DIR="$(dirname "${BASH_SOURCE}")"

sudo add-apt-repository --yes ppa:mmstick76/alacritty
sudo apt update
sudo apt install install --yes alacritty

sudo update-alternatives --set x-terminal-emulator /usr/bin/alacritty

ln -fv "${LOCAL_DIR}/alacritty.yml" ~/.config/alacritty/alacritty.yml
