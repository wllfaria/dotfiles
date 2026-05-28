#!/bin/bash

source "$(dirname "${BASH_SOURCE[0]}")/common.sh"

set_platform_symlinks() {
    set_common_symlinks $FORCE_FLAG

    if [[ $(detect_system) == "Mac" ]]; then 
        set_macos_symlinks $FORCE_FLAG;
    fi
}

maybe_install_platform_programs() {
    case "$(detect_system)" in
        Mac) maybe_install_macos_programs $FORCE_FLAG ;;
        Linux) maybe_install_linux_programs $FORCE_FLAG ;;
    esac
}

maybe_install_linux_programs() {
    if [[ $(detect_system) == "Mac" ]]; then return; fi
}

maybe_install_macos_programs() {
    if [[ $(detect_system) != "Mac" ]]; then return; fi
    brew_install "aerospace" "$1"
}
