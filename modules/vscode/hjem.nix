{config, lib, stablePkgs, ...}: let
  # Override and use stable packages due to unstable build failure
  pkgs = stablePkgs;
  plugins = import ./vscode-plugins.nix {inherit pkgs lib;};
  cfg = config.features.vscode.enable;
in {
  users.users.michael.packages = (if cfg then import ./base.nix {inherit pkgs plugins;} else []);
}