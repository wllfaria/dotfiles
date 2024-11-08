{ pkgs, inputs, ... }:
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
        homeDirectory = "/Users/wiru";
    };

    home.packages = with pkgs; [ 
        lldb
    ];

    home.file = {
        ".config/wezterm" = {
            source = ../wezterm;
            recursive = true;
        };
    };
}
