#!/bin/bash
#
# Install UbuntuMono Nerd Font with Powerline symbols and icons.

readonly FONT_ZIP="UbuntuMono.zip"
readonly FONT_DESTINATION_DIRECTORY="${HOME}/.local/share/fonts"

curl --location --remote-name "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/${FONT_ZIP}"

mkdir --parents $FONT_DESTINATION_DIRECTORY
unzip $FONT_ZIP -d $FONT_DESTINATION_DIRECTORY
rm $FONT_ZIP
