#!/bin/bash
#
# Install all dotfiles, including system dependencies.

# Install UbuntuMono Nerd Font with Powerline symbols and icons.

echo "Installing fonts ..."

readonly FONT_ZIP="UbuntuMono.zip"
readonly FONT_DIR="${HOME}/.local/share/fonts/"

mkdir -p $FONT_DIR

curl -fsOSL "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/${FONT_ZIP}"
unzip -q $FONT_ZIP -d $FONT_DIR

rm $FONT_ZIP

# Install specific applications.

for dir in ./*/; do
  echo "Installing $(basename $dir) ..."

  source "${dir}/install.sh"
done

exit 0

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
#     * InstantRst
#     * MEGA
#     * VimPlug
#
# * Environment
#
#   * Bash
#   * Git
#   * Vim

# Installation
# ============

# Packages
# --------

# apt
# ^^^

apt_packages=(
  build-essential
  cmake
  exuberant-ctags
  git
  libbz2-dev
  libreadline-dev
  libssl-dev
  libssl1.0-dev
  libsqlite3-dev
  python3-pip
  jq
  ruby
  tidy
  vim-gnome
)

sudo apt install -y ${apt_packages[@]}

# gem
# ^^^

gem_packages=(
  mdl
)

sudo gem install ${gem_packages[@]}

# pip
# ^^^

pip_packages=(
  flake8
  ipdb
  mypy
  pipenv
  pylint
  sphinx
  virtualenv
  virtualenvwrapper
)

pip3 install --user ${pip_packages[@]}

# Scripts
# -------

# InstantRst
# ^^^^^^^^^^

pip3 install --user https://github.com/Rykka/instant-rst.py/archive/master.zip

# MEGA
# ^^^^

# TODO:
#
# Change links to 18.04 version.

wget https://mega.nz/linux/MEGAsync/xUbuntu_17.10/amd64/megasync-xUbuntu_17.10_amd64.deb
wget https://mega.nz/linux/MEGAsync/xUbuntu_17.10/amd64/nautilus-megasync-xUbuntu_17.10_amd64.deb

mega_packages=(
  libcanberra-gtk-module
  libc-ares2
  libcrypto++6
  libmediainfo0v5
  libmms0
  libtinyxml2-6
  libzen0v5
)

sudo apt install -y ${mega_packages[@]}

sudo dpkg -i megasync-xUbuntu_17.10_amd64.deb
sudo dpkg -i nautilus-megasync-xUbuntu_17.10_amd64.deb

rm megasync-xUbuntu_17.10_amd64.deb
rm nautilus-megasync-xUbuntu_17.10_amd64.deb

# VimPlug
# ^^^^^^^

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Environment
# ===========

mkdir github
cd github

git clone https://github.com/daviebadger/cookiecutter-python
git clone https://github.com/daviebadger/dotfiles
git clone https://github.com/daviebadger/notes

git clone https://github.com/pyenv/pyenv.git ~/.pyenv

cd dotfiles

# Bash
# ----

cp bash/bash_aliases ~/.bash_aliases
cp bash/bash_profile ~/.bash_profile
cp bash/shell_prompt.sh ~/.shell_prompt.sh

ln -f ~/.bash_aliases bash/bash_aliases
ln -f ~/.bash_profile bash/bash_profile
ln -f ~/.shell_prompt.sh bash/shell_prompt.sh

source ~/.bash_profile

# Git
# ---

cp git/gitconfig ~/.gitconfig

ln -f ~/.gitconfig git/gitconfig

# Vim
# ---

cp vim/vimrc ~/.vimrc

ln -f ~/.vimrc vim/vimrc

mkdir ~/.vim/snippets/
mkdir ~/.vim/swaps/

cp vim/snippets/* ~/.vim/snippets/

for file in ~/.vim/snippets/*
do
  ln -f $file vim/snippets/$(basename "$file")
done

# Go home at the end of this script

cd
