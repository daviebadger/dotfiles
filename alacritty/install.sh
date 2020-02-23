#!/usr/bin/env bash

sudo add-apt-repository --yes ppa:mmstick76/alacritty
sudo apt update
sudo apt install install --yes alacritty

sudo update-alternatives --set x-terminal-emulator /usr/bin/alacritty
