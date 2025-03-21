# Base Entry for Home-Manager
{config, lib, pkgs, ...}: let 
  inherit (lib) mkDefault optionalAttrs optionals;
  inherit (config.features.michael) useHome graphics;
  minGfxPkgs = optionals minimalGraphical (import ./packages/minimalGraphical.nix { inherit pkgs; });
  extGfxPkgs = optionals extendedGraphical (import ./packages/extendedGraphical.nix { inherit pkgs; });
in {
  imports = [
    ./programs
    ./options/features.nix
    ./modules/vscode/home.nix
  ];

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;

  home = {
    username = "michael";
    homeDirectory = "/home/michael";
    stateVersion = mkDefault "24.05";
    sessionVariables = {
      EDITOR = "nvim";
      BROWSER = "librewolf";
      NIXOS_OZONE_WL = "1";
      GTK_USE_PORTAL = "1";
    };
  } // optionalAttrs useHome {
    file = import ./files/fileList.nix {inherit config lib;};
    packages = (import ./packages/common.nix {inherit pkgs;}) ++ minGfxPkgs ++ extGfxPkgs;
  };
}
