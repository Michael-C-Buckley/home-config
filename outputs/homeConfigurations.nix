{flake, inputs, pkgs, ...}: let
  inherit (inputs) home-manager nixpkgs;

  homeConfig = {
    modules ? [],
    system ? "x86_64-linux",
  }:
    home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = {inherit inputs system;};
      modules = [../flake/home] ++ modules;
    };
in {
  flake.homeConfigurations = {
    "michael@x570" = homeConfig {
      modules = [../flake/home/hosts/x570.nix];
    };
    "michael@t14" = homeConfig {
      modules = [../flake/home/hosts/t14.nix];
    };
  };
}
