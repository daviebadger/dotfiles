#!/bin/bash
#
# * Installation
#
#   * Packages
#
#     * apt
#     * gem
#     * pip
#
#   * Scripts
#
#     * MEGA
#     * PowerlineFonts
#     * VimPlug
#
# * Environment
#
#   * Configuration
#
#     * Bash
#     * Git
#     * Vim

# Installation
# ============

# Packages
# --------

# apt
# ^^^

apt_packages=(
  cmake
  git
  python3-pip
  tidy
  vim-gnome
)

apt install -y ${apt_packages[@]}

# gem
# ^^^

gem_packages=(
  mdl
)

gem install ${gem_packages[@]}

# pip
# ^^^

pip_packages=(
  docutils
  flake8
  mypy
  pylint
  virtualenv
  virtualenvwrapper
)

pip3 install ${pip_packages[@]}

# Scripts
# -------

# MEGA
# ^^^^

wget https://mega.nz/linux/MEGAsync/xUbuntu_17.04/amd64/megasync-xUbuntu_17.04_amd64.deb
wget https://mega.nz/linux/MEGAsync/xUbuntu_17.04/amd64/nautilus-megasync-xUbuntu_17.04_amd64.deb

apt install -y libc-ares2 libcrypto++6

dpkg -i megasync-xUbuntu_17.04_amd64.deb
dpkg -i nautilus-megasync-xUbuntu_17.04_amd64.deb

rm megasync-xUbuntu_17.04_amd64.deb
rm nautilus-megasync-xUbuntu_17.04_amd64.deb

# PowerlineFonts
# ^^^^^^^^^^^^^^

git clone https://github.com/powerline/fonts.git --depth=1

cd fonts
./install.sh
cd ..
rm -rf fonts

# VimPlug
# ^^^^^^^

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Environment
# ===========

# Configuration
# -------------

mkdir gitlab
cd gitlab

git clone https://gitlab.com/daviebadger/configs.git

cd configs

# Bash
# ^^^^

cd bash

cp bash_aliases ~/.bash_aliases
cp shell_prompt.sh ~/.shell_prompt.sh

ln -f ~/.bash_aliases bash_aliases
ln -f ~/.shell_prompt.sh shell_prompt.sh

cat < bashrc >> ~/.bashrc

source ~/.bashrc

cd ..

# Git
# ^^^

cd git

cp gitconfig ~/.gitconfig
cp gitignore ~/.gitignore

ln -f ~/.gitignore gitignore

cd ..

# Vim
# ^^^

cd vim

cp vimrc ~/.vimrc
ln -f ~/.vimrc vimrc

mkdir ~/.vimrc/swaps/

cd ..
