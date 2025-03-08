{config, lib, pkgs, ...}: let
  plugins = import ./vscode-plugins.nix {inherit pkgs lib;};
in {
  home.packages = [
    (import ./base.nix {inherit pkgs plugins;})
  ];
}