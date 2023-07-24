{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.cv.spotify;
in {
  options.cv.spotify.enable = mkOption {
    description = "Enable spotify";
    type = types.bool;
    default = false;
  };

  config = mkIf (cfg.enable) {
    home.packages = with pkgs; [
      spotify
    ];
  };
}
