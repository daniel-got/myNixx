{
  description = "zenful nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, home-manager }: {

    darwinConfigurations."mac" = nix-darwin.lib.darwinSystem {
      modules = [
        ./modules/darwin

        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable      = true;
            enableRosetta = true;
            user        = "dniel";
            autoMigrate = true;
          };
        }

        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs    = true;
          home-manager.useUserPackages  = true;
          home-manager.users.dniel      = import ./home;
        }
      ];
    };

  };
}
