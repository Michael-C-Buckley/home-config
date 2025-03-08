{config, lib, stablePkgs, ...}: let
  # Override with stable packages due to current unstable build failure
  pkgs = stablePkgs;
  plugins = import ./vscode-plugins.nix {inherit pkgs lib;};
  cfg = config.features.vscode.enable;
in {
  home.packages = (if cfg then import ./base.nix {inherit pkgs plugins;} else []);
}