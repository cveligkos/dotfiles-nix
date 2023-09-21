{
  pkgs,
  config,
  lib,
  nur,
  ...
}: {
  imports = [
    ./config/hyprland
    ./config/rofi
    ./config/waybar
    ./alacritty
    ./beancount
    ./firefox
    ./git
    ./spotify
    ./neovim
    ./taskwarrior
    ./zsh
    ./zathura
    ./wezterm
  ];

  config = {
    xdg.enable = true;

    programs.home-manager.enable = true;

    home.packages = with pkgs; [
      nnn
      ranger
      kitty

      xclip

      zip
      xz
      unzip
      unrar
      p7zip

      gparted

      ripgrep
      fd
      tokei
      jq
      jless
      yq-go
      exa
      fzf
      zellij
      helix
      lazygit
      bat

      nix-output-monitor
      nixpkgs-fmt
      nixd
      nil
      ccls
      rnix-lsp
      alejandra
      lua-language-server
      stylua
      vscode-langservers-extracted
      shellcheck
      nodePackages.bash-language-server
      nodePackages.pyright
      shfmt
      ruff
      mypy
      black

      btop
      lm_sensors

      kuro
      slack
      thunderbird
      obsidian

      spotify
      sptlrx

      vscode

      symfony-cli
      distrobox

      time
      killall
      zoxide

      gcc
      wget
      gnumake
      filezilla

      htop
      procs
      # firefox-devedition
      inotify-tools
      gitui

      hck
      # eww-wayland
      arion

      google-chrome
    ];
  };
}
