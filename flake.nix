{
  description = "Home Configs for Michael";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
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

    unstablePkgs = getPkgs {
      nixpkgs = inputs.nixpkgs-unstable;
      system = system;
    };

    baseHome = import ./home.nix;
    homeX570 = inputs.nixpkgs.lib.mkMerge [
      baseHome
      (import ./hosts/x570.nix)
    ];
    homeT14 = inputs.nixpkgs.lib.mkMerge [
      baseHome
      (import ./hosts/t14.nix)
    ];
  in {
    homeConfigurations = {
      "michael@x570" = hmConfig {
        extraSpecialArgs = {inherit inputs unstablePkgs;};
        inherit pkgs;
        modules = [homeX570];
      };

      "michael@t14" = hmConfig {
        extraSpecialArgs = {inherit inputs unstablePkgs;};
        inherit pkgs;
        modules = [homeT14];
      };

      "michael" = hmConfig {
        extraSpecialArgs = {inherit inputs unstablePkgs;};
        inherit pkgs;
        modules = [baseHome];
      };
    };

    nixosModules = {
      x570 = {config, ...}: {
        imports = [
          inputs.home-manager.nixosModules.home-manager
          homeX570
        ];
      };

      t14 = {config, ...}: {
        imports = [
          inputs.home-manager.nixosModules.home-manager
          homeT14
        ];
      };

      default = {config, ...}: {
        imports = [
          inputs.home-manager.nixosModules.home-manager
          baseHome
        ];
      };
    };
  };
}
