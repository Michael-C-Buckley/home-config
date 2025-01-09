{
  description = "Home Configs for Michael";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    wfetch = {
      url = "github:iynaix/wfetch";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    system = builtins.currentSystem;

    getPkgs = {
      nixpkgs,
      system,
    }:
      import nixpkgs {
        system = system;
        config = {allowUnfree = true;};
      };

    pkgs = getPkgs {
      nixpkgs = nixpkgs;
      system = system;
    };
    unstablePkgs = getPkgs {
      nixpkgs = inputs.nixpkgs-unstable;
      system = system;
    };
  in {
    homeConfigurations = {
      "michael@x570" = home-manager.lib.homeManagerConfiguration {
        extraSpecialArgs = {inherit inputs unstablePkgs;};
        pkgs = import nixpkgs {inherit system;};
        modules = [
          ./home.nix
          ./hosts/x570.nix
        ];
      };

      "michael@t14" = home-manager.lib.homeManagerConfiguration {
        extraSpecialArgs = {inherit inputs unstablePkgs;};
        pkgs = import nixpkgs {inherit system;};
        modules = [
          ./home.nix
          ./hosts/t14.nix
        ];
      };

      "michael" = home-manager.lib.homeManagerConfiguration {
        extraSpecialArgs = {inherit inputs unstablePkgs;};
        pkgs = import nixpkgs {inherit system;};
        modules = [
          ./home.nix
        ];
      };
    };
  };
}
