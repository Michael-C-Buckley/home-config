# Base Entry for Home-Manager
{config, lib, pkgs, ...}: let 
  inherit (lib) mkDefault optionalAttrs;
in {
  imports = [
    ./programs
    ./options/features.nix
    ./packages/vscode/home.nix
  ];

  nixpkgs.config.allowUnfree = true;

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
  } // optionalAttrs config.features.useHome {
    file = import ./files/fileList.nix {inherit config lib;};
    packages = (import ./packages/common.nix {inherit pkgs;});
  };
}
