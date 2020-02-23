#!/usr/bin/env bash

sudo apt-add-repository --yes ppa:fish-shell/release-3
sudo apt-get update
sudo apt-get install --yes fish

curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
