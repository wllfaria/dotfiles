#!/bin/bash
system="$(uname -a)"

command_exists() {
    command -v "$1" >/dev/null 2>&1
}

maybe_install_common() {
    # tools
    maybe_install_git
    maybe_install_neovim
    maybe_install_tmux
    maybe_install_utils

    # programming language stuff
    maybe_install_programming_langs
    maybe_install_lsps
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
    if [[ $system == "Mac" ]]; then
        return
    else
        if ! command_exists "git"; then
            echo "installing git"
            sudo pacman -S --noconfirm git
        fi
    fi
}

maybe_install_neovim() {
    if [[ $system == "Mac" ]]; then
        return
    else
        if ! command_exists "nvim"; then
            echo "installing neovim"
            paru -S --noconfirm neovim
        fi
    fi
}

maybe_install_tmux() {
    if [[ $system == "Mac" ]]; then
        return
    else
        if ! command_exists "tmux"; then
            echo "installing tmux"
            paru -S --noconfirm tmux
        fi
    fi
}

maybe_install_utils() {
    if [[ $system == "Mac" ]]; then
        return
    else
        if ! command_exists "fzf"; then
            echo "installing fzf"
            paru -S --noconfirm fzf
        fi
        if ! command_exists "fd"; then
            echo "installing fd"
            paru -S --noconfirm fd
        fi
        if ! command_exists "rg"; then
            echo "installing ripgrep"
            paru -S --noconfirm ripgrep
        fi
        if ! command_exists "stylua"; then
            echo "installing stylua"
            paru -S --noconfirm stylua
        fi
        if ! command_exists "prettierd"; then
            echo "installing prettierd"
            paru -S --noconfirm prettierd
        fi
        if ! command_exists "eza"; then
            echo "installing eza"
            paru -S --noconfirm eza
        fi
        if ! command_exists "zoxide"; then
            echo "installing zoxide"
            paru -S --noconfirm zoxide
        fi
        if ! command_exists "rlwrap"; then
            echo "installing rlwrap"
            paru -S --noconfirm rlwrap
        fi
        if ! command_exists "cljfmt"; then
            echo "installing cljfmt"
            paru -S --noconfirm cljfmt-bin
        fi
        if ! command_exists "just"; then
            echo "installing just"
            paru -S --noconfirm just 
        fi
    fi
}

maybe_install_programming_langs() {
    if ! command_exists "opam"; then
        echo "installing ocaml"
        bash -c "sh <(curl -fsSL https://opam.ocaml.org/install.sh)"
        opam init
        opam install ocaml-lsp-server odoc ocamlformat utop
    fi

    if [[ $system == "Mac" ]]; then
        return
    else
        if ! command_exists "go"; then
            echo "installing go"
            paru -S --noconfirm go
        fi
        if ! command_exists "zig"; then
            echo "installing zig"
            paru -S --noconfirm zig
        fi
        if ! command_exists "rustup"; then
            echo "installing rust"
            paru -S --noconfirm rustup
        fi
        if ! command_exists "clojure"; then
            echo "installing clojure"
            paru -S --noconfirm clojure
        fi
    fi
}

maybe_install_lsps() {
    if [[ $system == "Mac" ]]; then
        return
    else
        if ! command_exists "gopls"; then
            echo "installing gopls"
            paru -S --noconfirm gopls
        fi
        if ! command_exists "clangd"; then
            echo "installing clangd"
            paru -S --noconfirm clangd
        fi
        if ! command_exists "zls"; then
            echo "installing zls"
            paru -S --noconfirm zls
        fi
        if ! command_exists "lua-language-server"; then
            echo "installing lua_ls"
            paru -S --noconfirm lua-language-server
        fi
        if ! command_exists "rust-analyzer"; then
            echo "installing rust-analyzer"
            rustup component add rust-analyzer
        fi
        if ! command_exists "bash-language-server"; then
            echo "installing bash lsp"
            paru -S --noconfirm bash-language-server
        fi
        if ! command_exists "clojure-lsp"; then
            echo "installing clojure lsp"
            paru -S --noconfirm clojure-lsp-bin
        fi
    fi
}

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

    [ -e "$nvim" ] && rm -rf "$nvim"
    [ -e "$vim" ] && rm -rf "$vim"
    [ -e "$tmux" ] && rm -rf "$tmux"
    [ -e "$loc_git" ] && rm -f "$loc_git"
    [ -e "$tmux_sessionizer" ] && rm -f "$tmux_sessionizer"
    [ -e "$vimrc" ] && rm -f "$vimrc"
    [ -e "$zshrc" ] && rm -f "$zshrc"

    ln -sf ~/dotfiles/nvim "$nvim"
    ln -sf ~/dotfiles/vim "$vim"
    ln -sf ~/dotfiles/tmux "$tmux"
    ln -sf ~/dotfiles/loc-git "$loc_git"
    ln -sf ~/dotfiles/tmux-sessionizer "$tmux_sessionizer"
    ln -sf ~/dotfiles/.vimrc "$vimrc"
    ln -sf ~/dotfiles/.zshrc "$zshrc"
}

maybe_install_linux_programs() {
    if [[ $system == "Mac" ]]; then
        return
    fi

    if ! command_exists "zen-browser"; then
        paru -S --noconfirm zen-browser-bin
    fi
}

case "${system}" in
    Linux*)
        if [[ $system == *"WSL"* ]]; then
            system=WSL
        else
            system=Linux
        fi
    ;;
    Darwin*) system=Mac;;
esac

case "${system}" in
    Mac)
        maybe_install_common
        set_common_symlinks
    ;;
    Linux)
        maybe_install_common
        maybe_install_linux_programs
        set_common_symlinks
    ;;
    WSL)
        maybe_install_common
        set_common_symlinks
    ;;
esac
