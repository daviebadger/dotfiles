#!/bin/bash
#
# Install Fish, a user-friendly command line shell.

readonly SOURCE_DIRECTORY="$(dirname $BASH_SOURCE)"
readonly DESTINATION_DIRECTORY="${HOME}/.config/fish"
readonly DESTINATION_DIRECTORY_FUNCTIONS="${DESTINATION_DIRECTORY}/functions"

sudo pacman --sync --noconfirm fish

mkdir --parents $DESTINATION_DIRECTORY
mkdir --parents $DESTINATION_DIRECTORY_FUNCTIONS
ln --force "${SOURCE_DIRECTORY}/config.fish" $DESTINATION_DIRECTORY
ln --force "${SOURCE_DIRECTORY}/functions/"* $DESTINATION_DIRECTORY_FUNCTIONS

chsh --shell /usr/bin/fish
