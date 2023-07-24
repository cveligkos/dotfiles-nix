{
  pkgs,
  home-manager,
  system,
  lib,
  overlays,
  inputs,
  user,
  ...
}: {
  homeManagerUsers = {
    cveligkos = user.mkHomeManagerUser {
      username = "cveligkos";
      userConfig = {
        config.hyprland.enable = true;
        config.rofi.enable = true;
        config.waybar.enable = true;
        git.enable = true;
        spotify.enable = true;
        firefox.enable = true;
        neovim.enable = true;
        taskwarrior.enable = true;
        zsh.enable = true;
        zathura.enable = true;
        wezterm.enable = true;
      };
    };
  };

  systemUsers = {
    cveligkos = user.mkSystemUser {
      name = "cveligkos";
      uid = 1000;
      groups = ["wheel" "input" "networkmanager" "docker"];
      home = "/home/cveligkos";
      shell = pkgs.zsh;
      description = "Christos Veligkos";
    };
  };
}
