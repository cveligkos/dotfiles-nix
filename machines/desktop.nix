{
  pkgs,
  system,
  lib,
  overlays,
  host,
  userRegistry,
  ...
}: let
  desktopConfig = {
    plasma.enable = true;
    xorg.enable = true;
    audio.enable = true;
    bluetooth.enable = true;
    hyprland.enable = true;
    podman.enable = true;
    fonts.enable = true;
    _1password.enable = true;
  };

  desktopPassthroughConfig = {
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.efi.efiSysMountPoint = "/boot/efi";
    users.users = {
      cveligkos = userRegistry.systemUsers.cveligkos;
    };
  };
in
  host.mkHost {
    name = "desktop";
    initrdMods = ["amdgpu"];
    kernelMods = ["kvm-amd"];
    kernelParams = [];
    kernelPackage = pkgs.linuxPackages_latest;
    systemConfig = desktopConfig;
    passthroughConfig = desktopPassthroughConfig;
    cpuCores = 12;
    hardwareNixFile = ./hardware-config/desktop.nix;
    stateVersion = "22.11";
  }
