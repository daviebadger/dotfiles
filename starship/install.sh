#!/bin/bash
#
# Install Starship, a cross-shell prompt.

readonly LOCAL_DIR="$(dirname "${BASH_SOURCE}")"

curl -fsSL https://starship.rs/install.sh | bash

ln -f "${LOCAL_DIR}/starship.toml" ~/.config/starship.toml
