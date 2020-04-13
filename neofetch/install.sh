#!/bin/bash
#
# Install Neofetch, a command-line system information tool.

readonly SOURCE_DIRECTORY="$(dirname "${BASH_SOURCE[0]}")"
readonly DESTINATION_DIRECTORY="${HOME}/.config/neofetch"

sudo pacman --sync --noconfirm neofetch

mkdir --parents "${DESTINATION_DIRECTORY}"
ln --force "${SOURCE_DIRECTORY}/config.conf" "${DESTINATION_DIRECTORY}"
