{config, lib, pkgs, ...}: let
  plugins = import ./vscode-plugins.nix {inherit pkgs lib;};
in {
  users.users.michael.packages = [
    (import ./base.nix {inherit pkgs plugins;})
  ];
}