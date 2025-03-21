# Base Entry for the Hjem outputs
{config, pkgs, lib, inputs, ...}: let
  inherit (lib) optionals
  inherit (config.features.michael) minimalGraphical extendedGraphical;
  commonPackages = (import ./packages/common.nix {inherit pkgs;});
  minGfxPkgs = optionals minimalGraphical (import ./packages/minimalGraphical.nix { inherit pkgs; });
  extGfxPkgs = optionals extendedGraphical (import ./packages/extendedGraphical.nix { inherit pkgs; });


in {
  imports = [
    inputs.hjem.nixosModules.default
    ./options/features.nix
    ./modules/vscode/hjem.nix
  ];

  users.users.michael.packages = commonPackages ++ minGfxPkgs ++ extGfxPkgs;
  users.users.root.packages = commonPackages;

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