#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/setup/common.sh"
source "$SCRIPT_DIR/setup/tools.sh"
source "$SCRIPT_DIR/setup/symlinks.sh"
source "$SCRIPT_DIR/setup/platform.sh"

show_help() {
    cat << EOF
Usage: $0 [OPTIONS] [COMPONENTS...]

Setup script for development environment.

OPTIONS:
  -f, --force    Force reinstall/update components even if already present
  -h, --help     Show this message

COMPONENTS:
  nvim       Install or update Neovim
  tmux       Install or update tmux
  utils      Install utilities (fzf, ripgrep, bat, etc.)
  langs      Install programming languages (rust, ocaml, go)
  lsps       Install language servers
  symlinks   Create config symlinks
  platform   Install platform-specific programs (Linux/macOS)

Examples:
  $0                    # Install everything
  $0 nvim               # Install Neovim (only if not present)
  $0 --force nvim       # Force reinstall/update Neovim
  $0 -f utils langs     # Force reinstall utilities and languages
  $0 --force            # Force reinstall everything

EOF
}

setup_package_managers() {
    local system=$(detect_system)
    
    case "${system}" in
        Mac)
            maybe_install_homebrew
            ;;
        Linux|WSL)
            maybe_install_paru
            ;;
    esac
}

FORCE_FLAG=""
COMPONENTS=()
while [[ $# -gt 0 ]]; do
    case $1 in
        # if -f or --force is specified, store it to be used on update
        # functions
        -f|--force) FORCE_FLAG="--force"; shift ;;
        # regardless of force mode or not, if --help is present we
        # show the help message and cease execution
        -h|--help) show_help; exit 0 ;;
        # store every component that should be updated/installed if any
        *) COMPONENTS+=("$1"); shift ;;
    esac
done

run_component() {
    case "$1" in
        nvim) maybe_install_neovim $FORCE_FLAG ;;
        tmux) maybe_install_tmux $FORCE_FLAG ;;
        utils) maybe_install_utils $FORCE_FLAG ;;
        langs) maybe_install_programming_langs $FORCE_FLAG ;;
        lsps) maybe_install_lsps $FORCE_FLAG ;;
        symlinks) set_platform_symlinks $FORCE_FLAG ;;
        platform) maybe_install_platform_programs $FORCE_FLAG ;;
        *)
            echo "Unknown component: '$1'"
            echo "Run '$0 --help' for usage information"
            exit 1
            ;;
    esac
}

# Setup prerequisites
setup_package_managers
maybe_install_git

# If no components specified, install everything
if [ ${#COMPONENTS[@]} -eq 0 ]; then
    for component in nvim tmux utils langs lsps symlinks platform; do
        run_component "$component"
    done
else
    # Run specified components
    for component in "${COMPONENTS[@]}"; do
        run_component "$component"
    done
fi
