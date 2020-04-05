#!/bin/bash
#
# Install Fish, a user-friendly command line shell.

readonly SOURCE_DIR="$(dirname $BASH_SOURCE)"
readonly DESTINATION_DIR="${HOME}/.config/fish"

sudo pacman -S --noconfirm fish

mkdir -p $DESTINATION_DIR
ln -f "${SOURCE_DIR}/config.fish" $DESTINATION_DIR

chsh -s /usr/bin/fish
