{inputs}: let
  inherit (inputs) home-manager nixpkgs;

  homeConfig = {
    modules ? [],
    system ? "x86_64-linux",
  }:
    home-manager.lib.homeManagerConfiguration {
      extraSpecialArgs = {inherit inputs system;};
      pkgs = import nixpkgs {inherit system;};
      modules = [../flake/home] ++ modules;
    };
in {
  "michael@x570" = homeConfig {
    modules = [../flake/home/hosts/x570.nix];
  };
  "michael@t14" = homeConfig {
    modules = [../flake/home/hosts/t14.nix];
  };
}
