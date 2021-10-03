#!/bin/bash

DOTFILES_PATH="$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"

# KITTY_PATH="/Users/codico/code/dotfiles/kitty/"
# VIM_PATH="/Users/codico/code/dotfiles/vim/.vimrc"
ZSH_PATH="/Users/codico/code/dotfiles/zsh/.zshrc"
# NVIM_PATH="/Users/codico/code/dotfiles/nvim/"

# ln -sf $KITTY_PATH ~/.config
# ln -sf $NVIM_PATH ~/.config
# ln -sf $VIM_PATH ~/.vimrc
ln -sf $ZSH_PATH ~/.zshrc

echo "Symlink Completed"
