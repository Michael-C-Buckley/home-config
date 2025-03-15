{config, lib, pkgs, ...}: let
  plugins = import ./vscode-plugins.nix {inherit pkgs lib;};
  cfg = config.features.vscode.enable;
  home = config.features.useHome;
in {
  home.packages = (if cfg && home then import ./base.nix {inherit pkgs plugins;} else []);
}