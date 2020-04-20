#!/bin/bash
#
# Install Sway, an i3-compatible Wayland compositor.

readonly SOURCE_DIRECTORY="$(dirname "${BASH_SOURCE[0]}")"
readonly DESTINATION_DIRECTORY="${HOME}/.config/sway"
readonly DESTINATION_DIRECTORY_CONFIG="${HOME}/.config/sway/config.d"

sudo pacman --sync --noconfirm sway

mkdir --parents "${DESTINATION_DIRECTORY}"
mkdir --parents "${DESTINATION_DIRECTORY_CONFIG}"
ln --force "${SOURCE_DIRECTORY}/config" "${DESTINATION_DIRECTORY}"
ln --force "${SOURCE_DIRECTORY}/config.d/"* "${DESTINATION_DIRECTORY_CONFIG}"
