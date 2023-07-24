{
  pkgs,
  home-manager,
  system,
  lib,
  overlays,
  inputs,
  ...
}: rec {
  user = import ./user.nix {inherit pkgs home-manager lib system overlays;};
  host = import ./host.nix {inherit pkgs home-manager system lib user inputs;};
}
