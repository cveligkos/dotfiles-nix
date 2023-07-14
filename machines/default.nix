{
  pkgs,
  home-manager,
  system,
  lib,
  overlays,
  host,
  userRegistry,
  inputs,
  ...
}: {
  desktop = import ./desktop.nix {
    inherit
      pkgs
      userRegistry
      home-manager
      host
      lib
      system
      overlays
      ;
  };
}
