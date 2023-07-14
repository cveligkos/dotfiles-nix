{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.cv._1password;
in {
  options.cv._1password.enable = mkOption {
    description = "Enable _1password";
    type = types.bool;
    default = false;
  };

  config = mkIf (cfg.enable) {
    home.packages = [
      pkgs._1password
      pkgs._1password-gui
    ];

    programs.ssh = {
      extraConfig = ''
        Host *
          IdentityAgent ~/.1password/agent.sock
      '';
    };
  };
}
