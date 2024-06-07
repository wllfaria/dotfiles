{ pkgs, inputs, ... }:
let ocamlPackages = pkgs.ocaml-ng.ocamlPackages_5_2;
in
{
  imports = [];

  nixpkgs = {
    overlays = [
      inputs.neovim-nightly-overlay.overlays.default
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
    # utilities
    btop
    inlyne
    curl
    zip
    unzip
    gzip
    xclip
    vesktop
    less
    jetbrains-mono

    # dev utils
    bat
    jq
    tokei
    fzf
    fd
    ripgrep
    eza
    zoxide
    tmux

    # debuggig / profiling
    gdb
    cargo-flamegraph
    perf-tools

    # dev stuff
    rustup
    cargo-expand
    cargo-watch
    gh
    lua
    go

    lua-language-server
    prettierd
    gopls
    stylua
  ]
  ++ (with nodePackages; [
    nodePackages.eslint
    nodePackages.eslint_d
    nodePackages.prettier
    nodePackages.svelte-language-server
    nodePackages.typescript-language-server
  ])
  ++ (with ocamlPackages; [
    ocaml
    dune_2
    ocamlformat
    opam
  ]);

  programs.home-manager.enable = true;

  programs.neovim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
  };

  programs.git = {
    enable = true;
    userName = "wiru";
    userEmail = "dev.willians.faria@gmail.com";
    signing = {
      key = "0E1E92EEB8953D2966535924B6C605C7C23A6F76";
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

    ".config/tmux" = {
      source = ../tmux;
      recursive = true;
    };

    ".config/nvim" = {
        source = ../nvim;
        recursive = true;
    };

    ".zshrc".source = ../.zshrc;
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
