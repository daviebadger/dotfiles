#!/bin/bash
#
# Install dotfiles, including system packages and applications.

set -eu

readonly INSTALL="Installing %s ...\n"

for dir in ./*/; do
  printf "${INSTALL}" $(basename $dir)

  source "${dir}/install.sh"
done
