#!/bin/bash

source "$(dirname "${BASH_SOURCE[0]}")/common.sh"

maybe_install_neovim() {
    local has_neovim=$(command_exists "nvim")
    if $has_neovim && [[ "$1" != "--force" ]]; then return; fi

    if $has_neovim; then echo "updating Neovim";
    else echo "installing Neovim"; fi

    local current_dir=$(pwd)
    rm -rf "$HOME/neovim"
    git clone https://github.com/neovim/neovim "$HOME/neovim"
    cd "$HOME/neovim"
    mkdir -p "$HOME/.local/bin"
    make CMAKE_BUILD_TYPE=Release
    make CMAKE_INSTALL_PREFIX="$HOME/.local" install
    rm -rf "$HOME/neovim"
    cd $current_dir
}

maybe_install_tmux() {
    case "$(detect_system)" in
        Mac) brew_install "tmux" "$1" ;;
        *) paru_install "tmux" "$1" ;;
    esac
}

maybe_install_utils() {
    local system=$(detect_system)
    
    # Every utility to install
    # First item is the binary name to check if exists
    # Second item is the program on AUR
    # Third item is the program on homebrew
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
    )

    for ((i=0; i<${#utils[@]}; i+=3)); do
        local has_util=$(command_exists "${utils[i]}")
        if $has_util && [[ "$1" != "--force" ]]; then continue; fi
        
        if [[ $system == "Mac" ]]; then
            brew_install_force "${utils[i + 2]}"
        else
            paru_install_force "${utils[i + 1]}"
        fi
    done

    local has_luacheck=$(command_exists "luacheck")
    if $has_luacheck && [[ "$1" != "--force" ]]; then return; fi
    
    if $has_luacheck; then echo "updating luacheck";
    else echo "installing luacheck"; fi
    sudo luarocks install luacheck
}

maybe_install_programming_langs() {
    local system=$(detect_system)
    
    # OCaml
    local has_opam=$(command_exists "opam")
    if ! $has_opam || [[ "$1" == "--force" ]]; then
        if $has_opam; then echo "updating ocaml";
        else echo "installing ocaml"; fi
        
        bash -c "sh <(curl -fsSL https://opam.ocaml.org/install.sh)"
        opam init
        opam install ocaml-lsp-server odoc ocamlformat utop
    fi

    # Other languages
    langs=(
        "go" "go" "go"
        "rustup" "rustup" "rustup"
    )

    for ((i=0; i<${#langs[@]}; i+=3)); do
        local has_lang=$(command_exists "${langs[i]}")
        if $has_lang && [[ "$1" != "--force" ]]; then continue; fi
        
        if [[ $system == "Mac" ]]; then
            brew_install_force "${langs[i + 2]}"
        else
            paru_install_force "${langs[i + 1]}"
        fi
    done
}

maybe_install_lsps() {
    local system=$(detect_system)
    
    lsps=(
        "clangd" "clang" "clangd"
        "lua-language-server" "lua-language-server" "lua-language-server"
        "rust-analyzer" "rust-analyzer" "rust-analyzer"
    )

    for ((i=0; i<${#lsps[@]}; i+=3)); do
        local has_lsp=$(command_exists "${lsps[i]}")
        if $has_lsp && [[ "$1" != "--force" ]]; then continue; fi
        
        if [[ $system == "Mac" ]]; then
            brew_install_force "${lsps[i + 2]}"
        else
            paru_install_force "${lsps[i + 1]}"
        fi
    done
}
