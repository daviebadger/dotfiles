#!/bin/bash
#
# Install Fish, a user-friendly command line shell.

readonly SOURCE_DIR="$(dirname $BASH_SOURCE)"
readonly DESTINATION_DIR="${HOME}/.config/fish"
readonly DESTINATION_DIR_FUNCTIONS="${DESTINATION_DIR}/functions"

sudo pacman -S --noconfirm fish

mkdir -p $DESTINATION_DIR $DESTINATION_DIR_FUNCTIONS
ln -f "${SOURCE_DIR}/config.fish" $DESTINATION_DIR
ln -f "${SOURCE_DIR}/functions/"* $DESTINATION_DIR_FUNCTIONS

chsh -s /usr/bin/fish
