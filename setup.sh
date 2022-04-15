#!/bin/bash

DOTFILES_PATH="$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"

KITTY_PATH="$HOME/code/dotfiles/kitty/"
VIM_PATH="$HOME/code/dotfiles/vim/.vimrc"
ZSH_PATH="$HOME/code/dotfiles/zsh/.zshrc"
NVIM_PATH="$HOME/code/dotfiles/nvim/"

# ln -sf $KITTY_PATH ~/.config
# ln -sf $NVIM_PATH ~/.config
# ln -sf $VIM_PATH ~/.vimrc
ln -sf $ZSH_PATH ~/.zshrc

echo "Symlink Completed"
