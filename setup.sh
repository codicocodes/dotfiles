#!/bin/bash

DOTFILES_PATH="$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"

KITTY_PATH="${DOTFILES_PATH}kitty/"
VIM_PATH="${DOTFILES_PATH}vim/.vimrc"
NVIM_PATH="${DOTFILES_PATH}nvim/init.lua"

ln -sf $KITTY_PATH ~/.config
ln -sf $NVIM_PATH ~/.config
ln -sf $VIM_PATH ~/.vimrc 

echo "Symlink Completed"
