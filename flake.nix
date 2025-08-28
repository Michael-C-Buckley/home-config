{
  description = "Home Configs for Michael";

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz";
    flake-parts.url = "git+https://github.com/hercules-ci/flake-parts?shallow=1";
    systems.url = "git+https://github.com/nix-systems/default?shallow=1";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hjem = {
      url = "git+https://github.com/feel-co/hjem?shallow=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hjem-rum = {
      url = "git+https://github.com/snugnug/hjem-rum?shallow=1";
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
          };
          minimal = _: {
            imports = [./flake/hjem/default.nix];
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
