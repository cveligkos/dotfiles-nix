{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.cv.firefox;
in {
  options.cv.firefox.enable = mkOption {
    description = "Enable firefox";
    type = types.bool;
    default = false;
  };

  config = mkIf (cfg.enable) {
    programs.firefox = {
      enable = true;
    };
  };
}
