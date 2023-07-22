{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.cv.taskwarrior;
in {
  options.cv.taskwarrior.enable = mkOption {
    description = "Enable taskwarrior";
    type = types.bool;
    default = false;
  };

  config = mkIf (cfg.enable) {
    programs.taskwarrior = {
      enable = true;
    };
  };
}
