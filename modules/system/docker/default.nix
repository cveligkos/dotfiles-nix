{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.cv.docker;
in {
  options.cv.docker.enable = mkOption {
    description = "Enable docker";
    type = types.bool;
    default = false;
  };

  config = mkIf (cfg.enable) {
    virtualisation = {
      docker = {
        enable = true;
      };
    };

    environment.systemPackages = with pkgs; [
      docker-compose
    ];
  };
}
