# Base Entry for the Hjem outputs
{config, pkgs, lib, commonPackages}: let
  inherit (lib) optionals ;
  inherit (config.features.michael) minimalGraphical extendedGraphical includeZed;
in 

commonPackages
++ optionals minimalGraphical (import ./packages/minimalGraphical.nix { inherit pkgs; })
++ optionals extendedGraphical (import ./packages/extendedGraphical.nix { inherit pkgs; })
++ optionals includeZed ([pkgs.zed-editor])