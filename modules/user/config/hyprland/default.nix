{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.cv.hyprland-config;
in {
  options.cv.hyprland-config.enable = mkOption {
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
