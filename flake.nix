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
        config = {allowUnfree = true;};
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
    homeManager.configurations = {
      "michael@x570" = hmConfig {
        extraSpecialArgs = {inherit inputs unstablePkgs;};
        pkgs = pkgs;
        modules = [
          ./home.nix
          ./hosts/x570.nix
        ];
      };

      "michael@t14" = hmConfig {
        extraSpecialArgs = {inherit inputs unstablePkgs;};
        pkgs = pkgs;
        modules = [
          ./home.nix
          ./hosts/t14.nix
        ];
      };

      "michael" = hmConfig {
        extraSpecialArgs = {inherit inputs unstablePkgs;};
        pkgs = pkgs;
        modules = [
          ./home.nix
        ];
      };
    };
    modules = {
      default = import ./home.nix;
      x570 = inputs.nixpkgs.lib.mkMerge [
        (import ./home.nix)
        (import ./hosts/x570.nix)
      ];
      t14 = inputs.nixpkgs.lib.mkMerge [
        (import ./home.nix)
        (import ./hosts/t14.nix)
      ];
    };
  };
}
