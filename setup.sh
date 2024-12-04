#!/bin/bash
system="$(uname -a)"

command_exists() {
    command -v "$1" >/dev/null 2>&1
}

paru_install() {
    echo "installing $1"
    paru -S --noconfirm $1
}

brew_install() {
    echo "installing $1"
    brew install $1
}

brew_install_cask() {
    echo "installing $1"
    brew install --cask $1
}

maybe_install_common() {
    # tools
    maybe_install_neovim
    maybe_install_tmux
    maybe_install_utils

    # programming language stuff
    maybe_install_programming_langs
    maybe_install_lsps
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
    if [[ $system == "Mac" ]]; then
        if ! command_exists "git"; then
            brew_install "git"
        fi
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
        if ! command_exists "nvim"; then
            brew_install "neovim"
        fi
        return
    else
        if ! command_exists "nvim"; then
            paru_install "neovim"
        fi
    fi
}

maybe_install_tmux() {
    if [[ $system == "Mac" ]]; then
        if ! command_exists "tmux"; then
            brew_install "tmux"
        fi
        return
    else
        if ! command_exists "tmux"; then
            paru_install "tmux"
        fi
    fi
}

maybe_install_utils() {
    if [[ $system == "Mac" ]]; then
        if ! command_exists "fzf"; then
            brew_install "fzf"
        fi
        if ! command_exists "fd"; then
            brew_install "fd"
        fi
        if ! command_exists "rg"; then
            brew_install "ripgrep"
        fi
        if ! command_exists "stylua"; then
            brew_install "stylua"
        fi
        if ! command_exists "prettierd"; then
            brew_install "prettierd"
        fi
        if ! command_exists "eza"; then
            brew_install "eza"
        fi
        if ! command_exists "zoxide"; then
            brew_install "zoxide"
        fi
        if ! command_exists "rlwrap"; then
            brew_install "rlwrap"
        fi
        if ! command_exists "cljfmt"; then
            brew_install "cljfmt"
        fi
        if ! command_exists "just"; then
            brew_install "just"
        fi
        if ! command_exists "btop"; then
            brew_install "btop"
        fi
        if ! command_exists "zip"; then
            brew_install "zip"
        fi
        if ! command_exists "unzip"; then
            brew_install "unzip"
        fi
        if ! command_exists "gzip"; then
            brew_install "gzip"
        fi
        if ! command_exists "bat"; then
            brew_install "bat"
        fi
        if ! command_exists "jq"; then
            brew_install "jq"
        fi
        if ! command_exists "tokei"; then
            brew_install "tokei"
        fi
        if ! command_exists "tokei"; then
            brew_install "tokei"
        fi
        return
    else
        if ! command_exists "fzf"; then
            paru_install "fzf"
        fi
        if ! command_exists "fd"; then
            paru_install "fd"
        fi
        if ! command_exists "rg"; then
            paru_install "ripgrep"
        fi
        if ! command_exists "stylua"; then
            paru_install "stylua"
        fi
        if ! command_exists "prettierd"; then
            paru_install "prettierd"
        fi
        if ! command_exists "eza"; then
            paru_install "eza"
        fi
        if ! command_exists "zoxide"; then
            paru_install "zoxide"
        fi
        if ! command_exists "rlwrap"; then
            paru_install "rlwrap"
        fi
        if ! command_exists "cljfmt"; then
            paru_install "cljfmt-bin"
        fi
        if ! command_exists "just"; then
            paru_install "just"
        fi
        if ! command_exists "btop"; then
            paru_install "btop"
        fi
        if ! command_exists "zip"; then
            paru_install "zip"
        fi
        if ! command_exists "unzip"; then
            paru_install "unzip"
        fi
        if ! command_exists "gzip"; then
            paru_install "gzip"
        fi
        if ! command_exists "bat"; then
            paru_install "bat"
        fi
        if ! command_exists "jq"; then
            paru_install "jq"
        fi
        if ! command_exists "tokei"; then
            paru_install "tokei"
        fi
        if ! command_exists "tokei"; then
            paru_install "tokei"
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
        if ! command_exists "go"; then
            brew_install "go"
        fi
        if ! command_exists "zig"; then
            brew_install "zig"
        fi
        if ! command_exists "rustup"; then
            brew_install "rustup"
        fi
        if ! command_exists "clojure"; then
            brew_install "clojure"
        fi
        return
    else
        if ! command_exists "go"; then
            paru_install "go"
        fi
        if ! command_exists "zig"; then
            paru_install "zig"
        fi
        if ! command_exists "rustup"; then
            paru_install "rustup"
        fi
        if ! command_exists "clojure"; then
            paru_install "clojure"
        fi
    fi
}

maybe_install_lsps() {
    if [[ $system == "Mac" ]]; then
        if ! command_exists "gopls"; then
            brew_install "gopls"
        fi
        if ! command_exists "zls"; then
            brew_install "zls"
        fi
        if ! command_exists "lua-language-server"; then
            brew_install "lua-language-server"
        fi
        if ! command_exists "rust-analyzer"; then
            echo "installing rust-analyzer"
            rustup component add rust-analyzer
        fi
        if ! command_exists "bash-language-server"; then
            brew_install "bash-language-server"
        fi
        if ! command_exists "clojure-lsp"; then
            brew_install "clojure-lsp"
        fi
        return
    else
        if ! command_exists "gopls"; then
            paru_install "gopls"
        fi
        if ! command_exists "clangd"; then
            paru_install "clangd"
        fi
        if ! command_exists "zls"; then
            paru_install "zls"
        fi
        if ! command_exists "lua-language-server"; then
            paru_install "lua-language-server"
        fi
        if ! command_exists "rust-analyzer"; then
            echo "installing rust-analyzer"
            rustup component add rust-analyzer
        fi
        if ! command_exists "bash-language-server"; then
            paru_install "bash-language-server"
        fi
        if ! command_exists "clojure-lsp"; then
            paru_install "clojure-lsp-bin"
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

set_macos_symlinks() {
    wezterm="$HOME/.config/wezterm"

    [ -e "$wezterm" ] && rm -rf "$wezterm"

    ln -sf ~/dotfiles/wezterm "$wezterm"
}

maybe_install_linux_programs() {
    if [[ $system == "Mac" ]]; then
        return
    fi

    if ! command_exists "zen-browser"; then
        paru_install "zen-browser-bin"
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
	maybe_install_homebrew
    	maybe_install_git
        maybe_install_common
        set_common_symlinks
        set_macos_symlinks
    ;;
    Linux)
    	maybe_install_git
	maybe_install_paru
        maybe_install_common
        maybe_install_linux_programs
        set_common_symlinks
    ;;
    WSL)
    	maybe_install_git
	maybe_install_paru
        maybe_install_common
        set_common_symlinks
    ;;
esac
