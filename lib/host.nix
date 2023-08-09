{
  system,
  pkgs,
  lib,
  user,
  inputs,
  ...
}:
with builtins; {
  mkHost = {
    name,
    initrdMods,
    kernelMods,
    kernelParams,
    kernelPackage,
    systemConfig,
    passthroughConfig,
    cpuCores,
    hardwareNixFile ? null,
    stateVersion,
  }:
    lib.nixosSystem {
      inherit system;

      modules = [
        {
          imports = [
            (import ../modules/system {inherit lib config pkg;})
            hardwareNixFile
          ];

          config = {
            cv = systemConfig;

            nix.settings.experimental-features = ["nix-command" "flakes"];

            networking.hostName = "${name}";

            networking.networkmanager.enable = true;

            boot.initrd.availableKernelModules = initrdMods;
            boot.kernelModules = kernelMods;
            boot.kernelParams = kernelParams;
            boot.kernelPackages = kernelPackage;

            nixpkgs.pkgs = pkgs;
            nix.settings.max-jobs = lib.mkDefault cpuCores;

            system.stateVersion = stateVersion;

            time.timeZone = "Europe/Athens";

            # Select internationalisation properties.
            i18n.defaultLocale = "en_US.UTF-8";

            i18n.extraLocaleSettings = {
              LC_ADDRESS = "el_GR.UTF-8";
              LC_IDENTIFICATION = "el_GR.UTF-8";
              LC_MEASUREMENT = "el_GR.UTF-8";
              LC_MONETARY = "el_GR.UTF-8";
              LC_NAME = "el_GR.UTF-8";
              LC_NUMERIC = "el_GR.UTF-8";
              LC_PAPER = "el_GR.UTF-8";
              LC_TELEPHONE = "el_GR.UTF-8";
              LC_TIME = "el_GR.UTF-8";
            };

            programs.zsh.enable = true;

            environment.shells = [pkgs.zsh];
            environment.pathsToLink = ["/share/zsh"];

            environment.systemPackages = with pkgs; [
              neovim
              helix
              git

              direnv
              nix-direnv
            ];
          };
        }
        {
          config = passthroughConfig;
        }
      ];
    };
}
