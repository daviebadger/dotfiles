#!/bin/bash
#
# Install Fish, a user-friendly command line shell.

readonly LOCAL_DIR="$(dirname $BASH_SOURCE)"

sudo apt-add-repository --yes ppa:fish-shell/release-3
sudo apt update
sudo apt install --yes fish

curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

ln -f "${LOCAL_DIR}/config.fish" ~/.config/fish/config.fish

sudo chsh -s /usr/bin/fish
