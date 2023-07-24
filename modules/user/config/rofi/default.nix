{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.cv.config.rofi;
in {
  options.cv.config.rofi.enable = mkOption {
    description = "Enable rofi config";
    type = types.bool;
    default = false;
  };

  config = mkIf (cfg.enable) {
    home.file = {
      rofi-config = {
        enable = true;
        source = ./config.rasi;
        target = ".config/rofi/config.rasi";
      };

      rofi-catppuccin-mocha-theme = {
        enable = true;
        source = ./catppuccin-mocha.rasi;
        target = ".config/rofi/catppuccin-mocha.rasi";
      };
    };
  };
}
