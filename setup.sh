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
    # Every utility to install
    # First item is the binary name to check if exists
    # Second item is the program on AUR
    # Third item is the program on homebrew
    #
    # this is f'ing ugly and hacky and i love it
    utils=(
        "fzf" "fzf" "fzf"
        "fd" "fd" "fd"
        "rg" "ripgrep" "ripgrep"
        "stylua" "stylua" "stylua"
        "prettierd" "prettierd" "prettierd"
        "eza" "eza" "eza"
        "zoxide" "zoxide" "zoxide"
        "rlwrap" "rlwrap" "rlwrap"
        "just" "just" "just"
        "btop" "btop" "btop"
        "zip" "zip" "zip"
        "unzip" "unzip" "unzip"
        "gzip" "gzip" "gzip"
        "bat" "bat" "bat"
        "jq" "jq" "jq"
        "tokei" "tokei" "tokei"
        "aerc" "aerc" "aerc"
        "luarocks" "luarocks" "luarocks"
        "zellij" "zellij" "zellij"
    )

    for ((i=0; i<${#utils[@]}; i+=3)); do
        if ! command_exists "${utils[i]}"; then
            if [[ $system == "Mac" ]]; then
                brew_install "${utils[i + 2]}"
            else
                paru_install "${utils[i + 1]}"
            fi
        fi
    done

    if ! command_exists "luacheck"; then
        luarocks install luacheck
    fi
}

maybe_install_programming_langs() {
    if ! command_exists "opam"; then
        echo "installing ocaml"
        bash -c "sh <(curl -fsSL https://opam.ocaml.org/install.sh)"
        opam init
        opam install ocaml-lsp-server odoc ocamlformat utop
    fi

    utils=(
        "go" "go" "go"
        "zig" "zig" "zig"
        "rustup" "rustup" "rustup"
    )

    for ((i=0; i<${#utils[@]}; i+=3)); do
        if ! command_exists "${utils[i]}"; then
            if [[ $system == "Mac" ]]; then
                brew_install "${utils[i + 2]}"
            else
                paru_install "${utils[i + 1]}"
            fi
        fi
    done
}

maybe_install_lsps() {
    utils=(
        "gopls" "gopls" "gopls"
        "clangd" "clangd" "clangd"
        "zls" "zls" "zls"
        "lua-language-server" "lua-language-server" "lua-language-server"
        "rust-analyzer" "rust-analyzer" "rust-analyzer"
        "bash-language-server" "bash-language-server" "bash-language-server"
    )

    for ((i=0; i<${#utils[@]}; i+=3)); do
        if ! command_exists "${utils[i]}"; then
            if [[ $system == "Mac" ]]; then
                brew_install "${utils[i + 2]}"
            else
                paru_install "${utils[i + 1]}"
            fi
        fi
    done
}

set_common_symlinks() {
    mkdir -p ~/.config
    mkdir -p ~/.local/bin
    rm -f ~/.zshrc
    rm -f ~/.vimrc

    nvim="$HOME/.config/nvim"
    vim="$HOME/.config/vim"
    tmux="$HOME/.config/tmux"
    zellij="$HOME/.config/zellij"
    loc_git="$HOME/.local/bin/loc-git"
    tmux_sessionizer="$HOME/.local/bin/tmux-sessionizer"
    zellij_sessionizer="$HOME/.local/bin/zellij-sessionizer"
    vimrc="$HOME/.vimrc"
    zshrc="$HOME/.zshrc"
    ghostty="$HOME/.config/ghostty"
    nushell="$HOME/.config/nushell"

    [ -e "$nvim" ] && rm -rf "$nvim"
    [ -e "$vim" ] && rm -rf "$vim"
    [ -e "$tmux" ] && rm -rf "$tmux"
    [ -e "$zellij" ] && rm -rf "$zellij"
    [ -e "$loc_git" ] && rm -f "$loc_git"
    [ -e "$tmux_sessionizer" ] && rm -f "$tmux_sessionizer"
    [ -e "$vimrc" ] && rm -f "$vimrc"
    [ -e "$zshrc" ] && rm -f "$zshrc"
    [ -e "$ghostty" ] && rm -f "$ghostty"
    [ -e "$nushell" ] && rm -f "$nushell"

    ln -sf ~/dotfiles/nvim "$nvim"
    ln -sf ~/dotfiles/zellij "$zellij"
    ln -sf ~/dotfiles/vim "$vim"
    ln -sf ~/dotfiles/tmux "$tmux"
    ln -sf ~/dotfiles/loc-git "$loc_git"
    ln -sf ~/dotfiles/tmux-sessionizer "$tmux_sessionizer"
    ln -sf ~/dotfiles/zellij-sessionizer "$zellij_sessionizer"
    ln -sf ~/dotfiles/.vimrc "$vimrc"
    ln -sf ~/dotfiles/.zshrc "$zshrc"
    ln -sf ~/dotfiles/ghostty "$ghostty"
    ln -sf ~/dotfiles/nushell "$nushell"
}

set_macos_symlinks() {
    wezterm="$HOME/.config/wezterm"
    aerospace="$HOME/.config/aerospace"
    sketchybar="$HOME/.config/sketchybar"

    [ -e "$wezterm" ] && rm -rf "$wezterm"
    [ -e "$aerospace" ] && rm -f "$aerospace"
    [ -e "$sketchybar" ] && rm -f "$sketchybar"

    ln -sf ~/dotfiles/wezterm "$wezterm"
    ln -sf ~/dotfiles/aerospace "$aerospace"
    ln -sf ~/dotfiles/sketchybar "$sketchybar"
}

maybe_install_linux_programs() {
    if [[ $system == "Mac" ]]; then
        return
    fi

    if ! command_exists "zen-browser"; then
        paru_install "zen-browser-bin"
    fi
}

maybe_install_macos_programs() {
    if [[ $system == "Mac" ]]; then
        if ! command_exists "aerospace"; then
            brew_install "aerospace"
        fi

        if ! command_exists "sketchybar"; then
            brew tap FelixKratz/formulae
            brew_install "sketchybar"
        fi

        if ! command_exists "nu"; then
            brew_install "nushell"
        fi
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
        maybe_install_macos_programs
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
