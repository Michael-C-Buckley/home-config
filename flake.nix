{
  description = "Home Configs for Michael";

  inputs = {
    # I'm using Cosmic and pinning their inputs for Cachix hits
    cosmic.url = "github:lilyinstarlight/nixos-cosmic";
    nixpkgs.follows = "cosmic/nixpkgs";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {self, ...} @ inputs: let
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
  in {
    homeConfigurations = {
      "michael@x570" = hmConfig {
        extraSpecialArgs = {inherit inputs;};
        inherit pkgs;
        modules = [./home.nix ./hosts/x570.nix];
      };

      "michael@t14" = hmConfig {
        extraSpecialArgs = {inherit inputs;};
        inherit pkgs;
        modules = [./home.nix ./hosts/t14.nix];
      };

      "michael" = hmConfig {
        extraSpecialArgs = {inherit inputs;};
        inherit pkgs;
        modules = [./home.nix];
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
