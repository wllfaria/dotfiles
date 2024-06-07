{ pkgs, inputs, ... }:
{
  imports = [];
  nixpkgs = {
    overlays = [];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _; true;
    };
  };

  home = {
    username = "wiru";
    homeDirectory: "/home/wiru";
  };

  home.packages = with pkgs; [ ];
}
