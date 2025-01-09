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

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
        system = builtins.currentSystem;

        getPkgs = { nixpkgs, system }: import nixpkgs {
        system = system;
        config = { allowUnfree = true; };
        };

        pkgs = getPkgs { nixpkgs = nixpkgs; system = system; };
        unstablePkgs = getPkgs { nixpkgs = inputs.nixpkgs-unstable; system = system; };

      homeConfig =
        {
          hostname ? null,
          features ? [ ],
          extraModules ? [ ],
        }:
        let
          hostFile = (
            if hostname != null then
              [
                ./hosts/${hostname}.nix
              ]
            else
              [ ]
          );
        in
        home-manager.lib.default {
          extraSpecialArgs = { inherit inputs features; };
          modules = [ ./home.nix ] ++ hostFile ++ extraModules;
        };
    in
    {
      homeConfigurations = {
        "michael@x570" = homeConfig {
          hostname = "x570";
        };
        "michael@t14" = homeConfig {
          hostname = "t14";
        };
        "michael" = homeConfig { };
      };
    };
}
