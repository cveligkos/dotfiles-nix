{
  pkgs,
  home-manager,
  lib,
  system,
  overlays,
  ...
}: {
  mkHomeManagerUser = {
    userConfig,
    username,
  }:
    home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        ../modules/users
        {
          config = {
            cv = userConfig;

            nixpkgs.overlays = overlays;
            nixpkgs.config.allowUnfree = true;

            home = {
              inherit username;
              stateVersion = "23.05";
              homeDirectory = "/home/${username}";
            };

            systemd.user.startServices = true;
          };
        }
      ];
    };

  mkSystemUser = {
    name,
    home,
    groups,
    uid,
    shell,
    description ? "",
    password ? null,
    ...
  }: {
    name = name;
    home = home;
    isNormalUser = true;
    isSystemUser = false;
    extraGroups = groups;
    description = description;
    uid = uid;
    shell = shell;
  };
}
