#!/bin/bash
#
# Install all dotfiles, including system packages.

set -eu

readonly INSTALL="Installing %s ...\n"

# Install UbuntuMono Nerd Font with Powerline symbols and icons.

printf "${INSTALL}" fonts

readonly FONT_ZIP="UbuntuMono.zip"
readonly FONT_DESTINATION_DIR="${HOME}/.local/share/fonts"

curl -fsLOS "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/${FONT_ZIP}"
mkdir -p $FONT_DESTINATION_DIR
unzip -q $FONT_ZIP -d $FONT_DESTINATION_DIR
rm $FONT_ZIP

# Install specific applications.

for dir in ./*/; do
  printf "${INSTALL}" $(basename $dir)

  source "${dir}/install.sh"
done
