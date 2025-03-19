# Base Entry for the Hjem outputs
{config, pkgs, lib, inputs, ...}: let
  inherit (config.features.michael) graphics;
  graphicalPackages = lib.optionals graphics (import ./packages/graphical.nix { inherit pkgs; });

in {
  imports = [
    inputs.hjem.nixosModules.default
    ./options/features.nix
    ./modules/vscode/hjem.nix
  ];

  users.users.michael.packages = (import ./packages/common.nix {inherit pkgs;}) ++ graphicalPackages;

  hjem = {
    clobberByDefault = true;
    users.michael = {
      enable = true;
      user = "michael";
      directory = "/home/michael";
      files = import ./files/fileList.nix {inherit config lib;};
    };
    # Here's an attempt at seeing if Hjem can apply user configs to root
    users.root = {
      enable = true;
      user = "root";
      directory = "/root";
      files = import ./files/fileList.nix {inherit config lib;};
    };
  };
}