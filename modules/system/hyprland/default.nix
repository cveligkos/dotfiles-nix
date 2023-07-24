{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.cv.hyprland;
in {
  options.cv.hyprland = {
    enable = mkOption {
      description = "Enable hyprland.";
      type = types.bool;
      default = false;
    };
  };

  config = mkIf (cfg.enable) {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
      xwayland.hidpi = false;
    };

    environment.sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = "1";
    };

    hardware = {
      opengl.enable = true;
    };

    xdg.portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = [pkgs.xdg-desktop-portal-gtk];
    };

    environment.systemPackages = with pkgs; [
      rofi-wayland
      mako
      libnotify
      swww
      wl-clipboard
      pulsemixer

      (
        waybar.overrideAttrs (oldAttrs: {
          mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
        })
      )
    ];
  };
}
