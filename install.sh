#!/bin/bash
#
# Install all applications.

set -eu

for directory in ./*/; do
  script="${directory}/install.sh"

  if [[ -f "${script}" ]]; then
    echo "Installing $(basename "${directory}") ..."

    # shellcheck source=/dev/null
    source "${script}"
  fi
done
