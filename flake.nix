{
  description = "Home Configs for Michael";

  outputs = {flake-parts, ...} @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = import inputs.systems;
      flake = {
        hjemConfigurations = import ./outputs/hjemConfigurations.nix {inherit inputs;};
        # homeConfigurations = {};
        userFiles = import ./outputs/userFiles.nix;
      };

      perSystem = {pkgs, ...}: {
        devShells = import ./outputs/devShells.nix {inherit pkgs;};
        packages = import ./outputs/packages.nix {inherit inputs pkgs;};
      };
    };

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz";

    flake-compat.url = "github:edolstra/flake-compat";
    flake-parts.url = "github:/hercules-ci/flake-parts";
    systems.url = "github:/nix-systems/default";

    nvf = {
      url = "github:notashelf/nvf";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-compat.follows = "flake-compat";
        flake-parts.follows = "flake-parts";
        systems.follows = "systems";
      };
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hjem = {
      url = "github:/feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hjem-rum = {
      url = "github:/snugnug/hjem-rum";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        hjem.follows = "hjem";
        ndg.inputs = {
          flake-compat.follows = "flake-compat";
          flake-parts.follows = "flake-parts";
        };
      };
    };
  };
}
