{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.cv.config.waybar;
in {
  options.cv.config.waybar.enable = mkOption {
    description = "Enable waybar config";
    type = types.bool;
    default = false;
  };

  config = mkIf (cfg.enable) {
    home.file = {
      config = {
        enable = true;
        source = ./config;
        target = ".config/waybar/config";
      };

      style = {
        enable = true;
        source = ./style.css;
        target = ".config/waybar/style.css";
      };
    };
  };
}
