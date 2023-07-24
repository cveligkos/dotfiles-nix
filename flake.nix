{
  description = "System config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    nur.url = "github:nix-community/NUR";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    nur,
    ...
  }: let
    inherit (nixpkgs) lib;

    util = import ./lib {
      inherit system nixpkgs pkgs home-manager lib inputs;
      overlays = [];
    };

    inherit (util) user;
    inherit (util) host;

    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
      overlays = [];
    };

    users = import ./users {
      inherit system nixpkgs pkgs home-manager lib inputs user;
      overlays = [];
    };

    machines = import ./machines {
      inherit system nixpkgs pkgs home-manager lib inputs host;
      userRegistry = users;
      overlays = [];
    };

    system = "x86_64-linux";
  in {
    homeConfigurations = {
      cveligkos = users.homeManagerUsers.cveligkos;
    };

    nixosConfigurations = with machines; {
      inherit desktop ideapad;
    };
  };
}
