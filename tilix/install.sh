#!/usr/bin/env bash

set -eux

cp -fl sessions/* ~/Templates
curl -sL --create-dirs -o ~/.config/tilix/schemes/davie8.json https://git.io/fhFvj

dconf load /com/gexperts/Tilix/ < tilix.dconf
