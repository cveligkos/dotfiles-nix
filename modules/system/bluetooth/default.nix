{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.cv.bluetooth;
in {
  options.cv.bluetooth.enable = mkOption {
    description = "Enable bluetooth";
    type = types.bool;
    default = false;
  };

  config = mkIf (cfg.enable) {
    hardware.bluetooth.enable = true;
  };
}
