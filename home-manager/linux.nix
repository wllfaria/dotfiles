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
    flameshot
    pavucontrol
    feh
    dunst
    nitrogen
    xfce.thunar
    xorg.xrandr

    # my display manager
    ly

    # gaming in linux is possible since 1999
    bottles
  ]
  ++ (with rocmPackages; [
    clang-tools-extra
  ]);

  home.file = {
    ".config/rofi" = {
      source = ../rofi;
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

    ".config/feh" = {
        source = ../feh;
        recursive = true;
    };

    ".config/dunst" = {
        source = ../dunst;
        recursive = true;
    };

    ".config/lucky" = {
        source = ../lucky;
        recursive = true;
    };

    ".config/polybar" = {
        source = ../polybar;
        recursive = true;
    };

    ".xinitrc".source = ../.xinitrc;
  };
}

