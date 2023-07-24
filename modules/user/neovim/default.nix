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
