#!/bin/bash
#
# Install Sway, an i3-compatible Wayland compositor.

readonly SOURCE_DIRECTORY="$(dirname "${BASH_SOURCE[0]}")"
readonly DESTINATION_DIRECTORY="${HOME}/.config/sway"

sudo pacman --sync --noconfirm sway

mkdir --parents "${DESTINATION_DIRECTORY}"
ln --force "${SOURCE_DIRECTORY}/config" "${DESTINATION_DIRECTORY}"
