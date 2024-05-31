{ pkgs, ... }:
{
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  nixpkgs = {
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "wiru";
    homeDirectory = "/home/wiru";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  home.packages = with pkgs; [
    # shell things
    zsh

    # utilities
    btop
    inlyne
    flameshot
    pavucontrol
    rofi
    wezterm
    curl
    bat
    zip
    unzip
    gzip
    coreutils
    feh
    dunst
    tokei
    fzf
    fd
    eza
    zoxide

    # debuggig / profiling
    gdb
    cargo-flamegraph
    perf-tools

    # dev stuff
    rustup
    cargo-expand
    cargo-watch
    gh
    go

    # LSP
    lua-language-server
    nodePackages.eslint
    nodePackages.eslint_d
    nodePackages.prettier
    nodePackages.svelte-language-server
    nodePackages.typescript-language-server
    prettierd
    gopls
    stylua

    # gaming in linux is possible since 1999
    bottles
    steam
  ];

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "wiru";
    userEmail = "dev.willians.faria@gmail.com";
    signing = {
      key = "69F358B33C62022D56C3AE505F5B711EF447A840";
      signByDefault = true;
    };
    extraConfig = {
      init = {
          defaultBranch = "main";
      };
      pull.rebase = true;
    };
    delta.enable = true;
  };

  programs.btop = {
      enable = true;
      settings = {
        color_theme = "rose-pine";
        theme_background = false;
        vim_keys = true;
      };
  };

  home.file = {
    ".config/wezterm" = {
      source = ../wezterm;
      recursive = true;
    };

    ".config/rofi" = {
      source = ../rofi;
      recursive = true;
    };

    ".config/tmux" = {
      source = ../tmux;
      recursive = true;
    };

    ".config/nvim" = {
        source = ../nvim;
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

    ".zshrc".source = ../.zshrc;
    ".xinitrc".source = ../.xinitrc;
    ".vimrc".source = ../.vimrc;

    ".local/bin/tmux-sessionizer" = {
        source = ../tmux-sessionizer;
        executable = true;
    };

    ".local/bin/loc-git" = {
        source = ../loc-git;
        executable = true;
    };
  };

  home.sessionVariables = {
    PATH = "${pkgs.lib.makeBinPath [pkgs.coreutils]}:~/.local/bin:$PATH";
  };

  systemd.user.startServices = "sd-switch";
  home.stateVersion = "24.05";
}
