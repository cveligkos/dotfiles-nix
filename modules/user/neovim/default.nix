{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.cv.neovim;
in {
  options.cv.neovim.enable = mkOption {
    description = "Enable neovim";
    type = types.bool;
    default = false;
  };

  config = mkIf (cfg.enable) {

    home.packages = with pkgs; [
      neovim

      # Language servers
      nil
      # nixd
      # rnix-lsp
      vscode-langservers-extracted
      lua-language-server
      nodePackages.bash-language-server
      nodePackages.svelte-language-server
      nodePackages.typescript-language-server
      nodePackages.vscode-json-languageserver
      nodePackages.pyright
      phpactor
      ccls
      rust-analyzer
      emmet-ls
      gopls
      beancount-language-server

      # Formatters
      nixpkgs-fmt
      alejandra
      stylua
      shfmt
      black
      # rustywind

      # Linters
      shellcheck
      ruff
      mypy


    ];

    home.file = {
      nvim-config = {
        enable = true;
        source = ./nvim;
        target = ".config/nvim";
        recursive = true;
      };
    };
  };
}
