{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.cv.alacritty;
in {
  options.cv.alacritty.enable = mkOption {
    description = "Enable alacritty";
    type = types.bool;
    default = false;
  };

  config = mkIf (cfg.enable) {


    home.packages = with pkgs; [
      alacritty
    ];

    home.file = {
      alacritty = {
        enable = true;
        source = ./alacritty.yml;
        target = ".config/alacritty/alacritty.yml";
      };
    };
  };
}
