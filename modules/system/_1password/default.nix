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
    programs._1password.enable = true;
    programs._1password-gui = {
      enable = true;
      # Certain features, including CLI integration and system authentication support,
      # require enabling PolKit integration on some desktop environments (e.g. Plasma).
      polkitPolicyOwners = ["cveligkos"];
    };
  };
}
