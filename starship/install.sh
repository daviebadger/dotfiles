#!/bin/bash
#
# Install Starship, a cross-shell prompt.

readonly SOURCE_DIRECTORY="$(dirname "${BASH_SOURCE[0]}")"
readonly DESTINATION_DIRECTORY="${HOME}/.config"

sudo bash -c "$(curl --fail --location --silent https://starship.rs/install.sh)" -- --yes

mkdir --parents "${DESTINATION_DIRECTORY}"
ln --force "${SOURCE_DIRECTORY}/starship.toml" "${DESTINATION_DIRECTORY}"
