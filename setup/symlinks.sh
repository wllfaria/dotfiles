#!/bin/bash

source "$(dirname "${BASH_SOURCE[0]}")/common.sh"

set_common_symlinks() {
    mkdir -p ~/.config
    mkdir -p ~/.local/bin
    rm -f ~/.zshrc
    rm -f ~/.vimrc

    nvim="$HOME/.config/nvim"
    vim="$HOME/.config/vim"
    tmux="$HOME/.config/tmux"
    loc_git="$HOME/.local/bin/loc-git"
    tmux_sessionizer="$HOME/.local/bin/tmux-sessionizer"
    vimrc="$HOME/.vimrc"
    zshrc="$HOME/.zshrc"
    bashrc="$HOME/.bashrc"
    ghostty="$HOME/.config/ghostty"
    btop="$HOME/.config/btop"

    [ -e "$nvim" ] && rm -rf "$nvim"
    [ -e "$vim" ] && rm -rf "$vim"
    [ -e "$tmux" ] && rm -rf "$tmux"
    [ -e "$loc_git" ] && rm -f "$loc_git"
    [ -e "$tmux_sessionizer" ] && rm -f "$tmux_sessionizer"
    [ -e "$vimrc" ] && rm -f "$vimrc"
    [ -e "$zshrc" ] && rm -f "$zshrc"
    [ -e "$bashrc" ] && rm -f "$bashrc"
    [ -e "$ghostty" ] && rm -f "$ghostty"
    [ -e "$btop" ] && rm -rf "$btop"

    ln -sf ~/dotfiles/nvim "$nvim"
    ln -sf ~/dotfiles/vim "$vim"
    ln -sf ~/dotfiles/tmux "$tmux"
    ln -sf ~/dotfiles/loc-git "$loc_git"
    ln -sf ~/dotfiles/tmux-sessionizer "$tmux_sessionizer"
    ln -sf ~/dotfiles/.vimrc "$vimrc"
    ln -sf ~/dotfiles/.zshrc "$zshrc"
    ln -sf ~/dotfiles/.bashrc "$bashrc"
    ln -sf ~/dotfiles/ghostty "$ghostty"
    ln -sf ~/dotfiles/btop "$btop"
}

set_macos_symlinks() {
    aerospace="$HOME/.config/aerospace"

    [ -e "$aerospace" ] && rm -f "$aerospace"

    ln -sf ~/dotfiles/aerospace "$aerospace"
}
