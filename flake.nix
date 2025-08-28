{
  description = "Home Configs for Michael";

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz";

    flake-compat.url = "github:edolstra/flake-compat";
    flake-parts.url = "github:/hercules-ci/flake-parts";
    systems.url = "github:/nix-systems/default";

    nvf-flake = {
      url = "github:Michael-C-Buckley/nvf-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
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
      };
    };
  };

  outputs = {flake-parts, ...} @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = import inputs.systems;
      flake = {
        hjemConfigurations = {
          default = _: {
            imports = [
              ./flake/hjem/default.nix
              ./flake/hjem/extended.nix
            ];
            # I am currently only using Hjem on x86_64-linux
            users.users.michael.packages = [inputs.nvf-flake.packages.x86_64-linux.default];
          };
          minimal = _: {
            # I am currently only using Hjem on x86_64-linux
            imports = [./flake/hjem/default.nix];
            users.users.michael.packages = [inputs.nvf-flake.packages.x86_64-linux.minimal];
          };
        };

        userFiles = {
          default = import ./flake/files.nix;
        };

        # homeConfigurations = {};
      };

      perSystem = {pkgs, ...}: {
        devShells.default = import ./flake/shell.nix {inherit pkgs;};

        packages = {
          ns = pkgs.callPackage ./flake/packages/ns.nix {};
        };
      };
    };
}
