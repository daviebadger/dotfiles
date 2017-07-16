#!/bin/bash
#
# * Installation
# * Imports

# Installation
# ============

apt install \
    git \
    python3-pip \
    vim-gnome \

# Vim checkers

apt install tidy

gem install --user-install mdl

pip3 install --user flake8 pylint mypy docutils

# Imports
# =======

mkdir gitlab && cd gitlab

git clone https://gitlab.com/daviebadger/configs
git clone https://gitlab.com/daviebadger/notes.git
git clone https://gitlab.com/daviebadger/poanda.git
