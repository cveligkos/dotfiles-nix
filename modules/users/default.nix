{
  pkgs,
  config,
  lib,
  nur,
  ...
}: {
  imports = [
    ./firefox
    ./git
    ./hyprland-config
    ./spotify
    ./neovim
    ./taskwarrior
    ./zsh
    ./zathura
    ./wezterm
  ];

  config = {
    xdg.enable = true;

    programs.home-manager = {
      enable = true;
    };

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

      btop
      lm_sensors

      _1password
      _1password-gui
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
      # eww-wayland
    ];
  };
}
