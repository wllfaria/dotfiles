#!/bin/bash

command_exists() {
    command -v "$1" >/dev/null 2>&1
}

paru_install() {
    if command_exists $1 && [[ "$2" != "--force" ]]; then return; fi
    echo "installing $1"
    paru -S --noconfirm $1
}

paru_install_force() {
    echo "installing $1"
    paru -S --noconfirm $1
}

brew_install() {
    if command_exists $1 && [[ "$2" != "--force" ]]; then return; fi
    echo "Installing $1"
    brew install $1
}

brew_install_force() {
    echo "installing $1"
    brew install $1
}

brew_install_cask() {
    if command_exists $1 && [[ "$2" != "--force" ]]; then return; fi
    echo "installing $1"
    brew install --cask $1
}

detect_system() {
    local system="$(uname -a)"
    
    case "${system}" in
        Linux*)
            if [[ $system == *"WSL"* ]]; then
                echo "WSL"
            else
                echo "Linux"
            fi
            ;;
        Darwin*) echo "Mac";;
    esac
}

maybe_install_homebrew() {
    if command_exists "brew"; then return; fi
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

maybe_install_paru() {
    if command_exists "paru"; then return; fi
    echo "installing paru"

    sudo pacman -S rustup
    rustup default stable

    # delete paru folder if already present for fresh clone
    sudo rm -R ~/paru

    # installing paru (https://github.com/Morganamilo/paru?tab=readme-ov-file#installation)
    sudo pacman -S --needed base-devel
    git clone https://aur.archlinux.org/paru.git ~/paru
    cd ~/paru
    makepkg -si

    cd ~/dotfiles
    sudo rm -R ~/paru
}

maybe_install_git() {
    if [[ $(detect_system) == "Mac" ]]; then brew_install "git"
    else paru_install git; fi
}
