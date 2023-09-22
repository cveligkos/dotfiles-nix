{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.cv.zellij;
in {
  options.cv.zellij.enable = mkOption {
    description = "Enable zellij";
    type = types.bool;
    default = false;
  };

  config = mkIf (cfg.enable) {
    home.packages = with pkgs; [
      zellij
    ];

    home.file = {
      zellij-config = {
        enable = true;
        source = ./config.kdl;
        target = ".config/zellij/config.kdl";
      };
    };
  };
}
