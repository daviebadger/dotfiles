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
  python3-pip
  ruby
  silversearcher-ag
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

wget https://mega.nz/linux/MEGAsync/xUbuntu_17.10/amd64/megasync-xUbuntu_17.10_amd64.deb
wget https://mega.nz/linux/MEGAsync/xUbuntu_17.10/amd64/nautilus-megasync-xUbuntu_17.10_amd64.deb

apt install -y libc-ares2 libcrypto++6

dpkg -i megasync-xUbuntu_17.10_amd64.deb
dpkg -i nautilus-megasync-xUbuntu_17.10_amd64.deb

rm megasync-xUbuntu_17.10_amd64.deb
rm nautilus-megasync-xUbuntu_17.10_amd64.deb

# PowerlineFonts
# ^^^^^^^^^^^^^^

git clone https://github.com/powerline/fonts.git --depth=1

./fonts/install.sh

rm -rf fonts

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
  ln -f $file snippets/$(basename "$file")
done

# Go home at the end of this script

cd
