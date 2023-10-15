#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
UBUNTU_DOTFILES="$SCRIPT_DIR/linux/ubuntu/.config"
CONFIG_FOLDERS=(
  "awesome"
  "nvim"
  "better-vim"
)

function remove_dir() {
  if [ -d "$UBUNTU_DOTFILES/$1" ]; then
    rm -rf $1
  fi
}

function copy_dir() {
  dotfiles_dir="$HOME/.config/$1" 
  if [ -d $dotfiles_dir ]; then
    cp -r $dotfiles_dir "$UBUNTU_DOTFILES/$1"
  fi
}

for item in "${CONFIG_FOLDERS[@]}"
do
  remove_dir $item
  copy_dir $item
done
