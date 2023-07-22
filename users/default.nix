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
      groups = ["wheel" "networkmanager" "docker"];
      home = "/home/cveligkos";
      shell = pkgs.zsh;
      description = "Christos Veligkos";
    };
  };
}
