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
      rnix-lsp
      alejandra
      lua-language-server
      stylua
      vscode-langservers-extracted
      shellcheck
      nodePackages.bash-language-server
      shfmt

      btop
      lm_sensors

      kuro
      slack
      thunderbird

      spotify
      sptlrx

      vscode

      symfony-cli

      time
      killall
      zoxide

      gcc
      wget
      gnumake

      htop
      procs
      obs-studio
      inotify-tools

      # eww-wayland
    ];
  };
}