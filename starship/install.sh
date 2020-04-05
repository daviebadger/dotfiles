#!/bin/bash
#
# Install Starship, a cross-shell prompt.

readonly SOURCE_DIR="$(dirname $BASH_SOURCE)"
readonly DESTINATION_DIR="${HOME}/.config"

bash -c "$(curl -fsLS https://starship.rs/install.sh)" -- -y

mkdir -p $DESTINATION_DIR
ln -f "${SOURCE_DIR}/starship.toml" $DESTINATION_DIR
