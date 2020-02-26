#!/bin/bash

readonly NEOFETCH="$(dirname "$0")"

set -eux

sudo apt install neofetch

mkdir -p ~/.config/neofetch
cp -fl "${NEOFETCH}/config.conf" ~/.config/neofetch/
