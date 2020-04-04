#!/bin/bash
#
# Install UbuntuMono Nerd Font with Powerline symbols and icons.

readonly FONT_ZIP="UbuntuMono.zip"
readonly FONT_DESTINATION_DIR="${HOME}/.local/share/fonts"

curl -fsLOS "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/${FONT_ZIP}"

mkdir -p $FONT_DESTINATION_DIR
unzip -q $FONT_ZIP -d $FONT_DESTINATION_DIR
rm $FONT_ZIP
