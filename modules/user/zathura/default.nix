{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.cv.zathura;
in {
  options.cv.zathura.enable = mkOption {
    description = "Enable zathura";
    type = types.bool;
    default = false;
  };

  config = mkIf (cfg.enable) {
    programs.zathura = {
      enable = true;
    };
  };
}
