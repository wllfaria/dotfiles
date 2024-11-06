{ pkgs, inputs, ... }:
let ocamlPackages = pkgs.ocaml-ng.ocamlPackages_5_2; in
    let rocmPackages = pkgs.rocmPackages_5.llvm;
in
    {
    imports = [];
    nixpkgs = {
        overlays = [];
        config = {
            allowUnfree = true;
            allowUnfreePredicate = _: true;
        };
    };

    home = {
        username = "wiru";
        homeDirectory = "/home/wiru";
    };

    home.packages = with pkgs; [ 
        perf-tools
        coreutils
        gdb
        pavucontrol
        dunst
        xorg.xrandr
    ]
        ++ (with rocmPackages; [
            clang-tools-extra
        ]);

    home.file = {
        ".config/alacritty" = {
            source = ../alacritty;
            recursive = true;
        };

        ".config/dunst" = {
            source = ../dunst;
            recursive = true;
        };

        ".config/fuzzel" = {
            source = ../fuzzel;
            recursive = true;
        }

        ".config/hypr" = {
            source = ../hypr;
            recursive = true;
        };

        ".config/i3" = {
            source = ../i3;
            recursive = true;
        };

        ".config/i3status" = {
            source = ../i3status;
            recursive = true;
        };

        ".config/lucky" = {
            source = ../lucky;
            recursive = true;
        };

        ".config/qt5ct" = {
            source = ../qt5ct;
            recursive = true;
        };

        ".config/rofi" = {
            source = ../rofi;
            recursive = true;
        };

        ".xinitrc".source = ../.xinitrc;
    };
}

