#!/bin/bash
CURRENT_PATH="$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"

KITTY_SOURCE="${CURRENT_PATH}kitty/"
KITTY_TARGET="~/.config"

VIM_SOURCE="${CURRENT_PATH}vim/.vimrc"
VIM_TARGET="~/.vimrc"

NVIM_SOURCE="${CURRENT_PATH}nvim/init.lua"
NVIM_TARGET="~/.config"

ZSH_SOURCE="${CURRENT_PATH}zsh/.zshrc"
ZSH_TARGET="~/.zshrc"

README = $(cat ./README.md)

echo "cat cat cat cat cat: ${README}"

echo "Initializing symlinks for config files..."
echo "You need to call ./setup/init.sh from the root directory (dotfiles/) of this project."
echo "Please confirm that this is the correth path to the root directory of this project: (y/n) ${CURRENT_PATH}"

read CORRECT_PATH

if [ $CORRECT_PATH = y ]
then
  echo Setup was called from the correct path. Running symlinks...
  echo "Symlinking ${KITTY_SOURCE} to ${KITTY_TARGET}"
  ln -sf $KITTY_SOURCE $KITTY_TARGET
  echo "Symlinking ${NVIM_SOURCE} to ${NVIM_TARGET}"
  ln -sf $NVIM_SOURCE $NVIM_TARGET
  echo "Symlinking ${VIM_SOURCE} to ${VIM_TARGET}"
  ln -sf $VIM_SOURCE $VIM_TARGET 
  echo "Symlinking ${ZSH_SOURCE} to ${ZSH_TARGET}"
  ln -sf $ZSH_SOURCE $ZSH_TARGET 
  pwd
else
  echo Setup script was not called from the right directory.
  echo Please call ./setup/init.sh from dotfiles/ in the project root.
  pwd
fi


# ln -sf $KITTY_SOURCE ~/.config
# ln -sf $NVIM_SOURCE ~/.config
# ln -sf $VIM_SOURCE ~/.vimrc 
# ln -sf $ZSH_SOURCE ~/.zshrc

echo "Symlink Completed"
