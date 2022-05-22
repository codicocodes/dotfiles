#!/bin/bash

DOTFILES_PATH="$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"

# KITTY_PATH="$HOME/code/dotfiles/kitty"
VIM_PATH="$HOME/code/dotfiles/vim/.vimrc"
ZSH_PATH="$HOME/code/dotfiles/zsh/.zshrc"
NVIM_PATH="$HOME/code/dotfiles/nvim"
FISH_PATH="$HOME/code/dotfiles/fish/config.fish"
I3_PATH="$HOME/code/dotfiles/i3"

ln -sf $KITTY_PATH ~/.config/kitty
ln -sf $NVIM_PATH ~/.config/nvim
ln -sf $VIM_PATH ~/.vimrc
ln -sf $ZSH_PATH ~/.zshrc
ln -sf $FISH_PATH ~/.config/fish/config.fish
ln -sf $I3_PATH ~/.config/i3 # if i3 already exists on the system????

echo "Symlink Completed"
