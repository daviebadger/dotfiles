#!/bin/bash
#
# Install i3-gaps, a tiling window manager with gaps.

readonly SOURCE_DIRECTORY="$(dirname "${BASH_SOURCE[0]}")"
readonly DESTINATION_DIRECTORY="${HOME}/.config/i3"

sudo pacman --sync --noconfirm i3-gaps

mkdir --parents "${DESTINATION_DIRECTORY}"
ln --force "${SOURCE_DIRECTORY}/config" "${DESTINATION_DIRECTORY}"
