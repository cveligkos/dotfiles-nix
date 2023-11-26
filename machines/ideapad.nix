{
  pkgs,
  system,
  lib,
  overlays,
  host,
  userRegistry,
  ...
}: let
  ideapadConfig = {
    plasma.enable = true;
    xorg.enable = true;
    audio.enable = true;
    bluetooth.enable = true;
    hyprland.enable = true;
    podman.enable = true;
    docker.enable = true;
    fonts.enable = true;
    _1password.enable = true;
  };

  ideapadPassthroughConfig = {
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.efi.efiSysMountPoint = "/boot";
    users.users = {
      cveligkos = userRegistry.systemUsers.cveligkos;
    };

    virtualisation.virtualbox.host.enable = true;
    users.extraGroups.vboxusers.members = ["cveligkos"];
    environment.etc.hosts.mode = "0644";
  };
in
  host.mkHost {
    name = "ideapad";
    initrdMods = ["amdgpu"];
    kernelMods = ["kvm-amd"];
    kernelParams = [];
    kernelPackage = pkgs.linuxPackages_latest;
    systemConfig = ideapadConfig;
    passthroughConfig = ideapadPassthroughConfig;
    cpuCores = 6;
    hardwareNixFile = ./hardware-config/ideapad.nix;
    stateVersion = "23.05";
  }
