{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.cv.podman;
in {
  options.cv.podman.enable = mkOption {
    description = "Enable podman";
    type = types.bool;
    default = false;
  };

  config = mkIf (cfg.enable) {
    virtualisation = {
      podman = {
        enable = true;

        # Create a `docker` alias for podman, to use it as a drop-in replacement
        dockerCompat = false;

        # Required for containers under podman-compose to be able to talk to each other.
        # defaultNetwork.settings.dns_enabled = true;
        # For Nixos version > 22.11
        defaultNetwork.settings = {
          dns_enabled = true;
        };
      };
    };

    environment.systemPackages = with pkgs; [
      buildah
    ];
  };
}
