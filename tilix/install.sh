#!/usr/bin/env bash

readonly TILIX="$(dirname "$0")"
readonly TILIX_SESSIONS="${TILIX}/sessions"

set -eux

cp -fl "${TILIX_SESSIONS}/"* ~/Templates
curl -sL --create-dirs -o ~/.config/tilix/schemes/davie8.json https://git.io/fhFvj

dconf load /com/gexperts/Tilix/ < "${TILIX}/tilix.dconf"
