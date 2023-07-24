{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.cv.config.hyprland;
in {
  options.cv.config.hyprland.enable = mkOption {
    description = "Enable hyprland config";
    type = types.bool;
    default = false;
  };

  config = mkIf (cfg.enable) {
    home.file = {
      hyprland-conf = {
        enable = true;
        source = ./hyprland.conf;
        target = ".config/hypr/hyprland.conf";
      };

      start-sh = {
        enable = true;
        source = ./start.sh;
        target = ".config/hypr/start.sh";
      };
    };
  };
}
