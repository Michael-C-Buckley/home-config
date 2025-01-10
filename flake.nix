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

  outputs = {self, ...} @ inputs: let
    system = "x86_64-linux";
    hm = inputs.home-manager;

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
    homeConfigurations = {
      "michael@x570" = hm.lib.homeManagerConfiguration {
        extraSpecialArgs = {inherit inputs unstablePkgs;};
        pkgs = pkgs;
        modules = [
          ./home.nix
          ./hosts/x570.nix
        ];
      };

      "michael@t14" = hm.lib.homeManagerConfiguration {
        extraSpecialArgs = {inherit inputs unstablePkgs;};
        pkgs = pkgs;
        modules = [
          ./home.nix
          ./hosts/t14.nix
        ];
      };

      "michael" = hm.lib.homeManagerConfiguration {
        extraSpecialArgs = {inherit inputs unstablePkgs;};
        pkgs = pkgs;
        modules = [
          ./home.nix
        ];
      };
    };
  };
}
