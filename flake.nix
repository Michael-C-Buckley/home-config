{
  description = "Home Configs for Michael";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    geometry = {
      url = "github:Michael-C-Buckley/geometry-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = {self, geometry, ...} @ inputs: let
    system = "x86_64-linux";
    hmConfig = inputs.home-manager.lib.homeManagerConfiguration;

    getPkgs = {
      nixpkgs,
      system,
    }:
      import nixpkgs {
        system = system;
        config.allowUnfree = true;
      };

    pkgs = getPkgs {
      nixpkgs = inputs.nixpkgs;
      system = system;
    };

    unstablePkgs = getPkgs {
      nixpkgs = inputs.nixpkgs-unstable;
      system = system;
    };
  in {
    homeConfigurations = {
      "michael@x570" = hmConfig {
        extraSpecialArgs = {inherit inputs unstablePkgs system geometry;};
        inherit pkgs;
        home-manager.users.michael.imports = [./home.nix ./hosts/x570.nix];
      };

      "michael@t14" = hmConfig {
        extraSpecialArgs = {inherit inputs unstablePkgs system geometry;};
        inherit pkgs;
        home-manager.users.michael.imports = [./home.nix ./hosts/t14.nix];
      };

      "michael" = hmConfig {
        extraSpecialArgs = {inherit inputs unstablePkgs system geometry;};
        inherit pkgs;
        home-manager.users.michael.imports = [./home.nix];
      };
    };

    nixosModules = {
      x570 = {...}: {
        imports = [
          ./home.nix
          ./hosts/x570.nix
        ];
      };

      t14 = {...}: {
        imports = [
          ./home.nix
          ./hosts/t14.nix
        ];
      };

      default = {...}: {
        imports = [
          ./home.nix
        ];
      };
    };
  };
}
