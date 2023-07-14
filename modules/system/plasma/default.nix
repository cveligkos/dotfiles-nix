{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.cv.plasma;
in {
  options.cv.plasma = {
    enable = mkOption {
      description = "Enable KDE plasma.";
      type = types.bool;
      default = false;
    };
  };

  config = mkIf (cfg.enable) {
    services.xserver.displayManager.sddm.enable = true;
    services.xserver.desktopManager.plasma5.enable = true;

    environment.plasma5.excludePackages = with pkgs.libsForQt5; [
      okular
      khelpcenter
    ];
  };
}
