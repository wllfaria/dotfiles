{ pkgs, inputs, ... }:
let ocamlPackages = pkgs.ocaml-ng.ocamlPackages_5_2;
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
    steam
    bottles
  ]
  ++ (with ocamlPackages; [
    ocaml
    dune_2
    ocamlformat
    opam
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

    ".xinitrc".source = ../.xinitrc;
  };
}

