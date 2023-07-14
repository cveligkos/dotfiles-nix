{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.cv.xorg;
in {
  options.cv.xorg = {
    enable = mkOption {
      description = "Enable xserver.";
      type = types.bool;
      default = false;
    };
  };

  config = mkIf (cfg.enable) {
    services.xserver = {
      enable = true;
      videoDrivers = ["modesetting" "fbdev"];

      layout = "us";
      xkbVariant = "";

      libinput.enable = true;
    };
  };
}
