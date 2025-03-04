# Base Entry for Home-Manager
{config, lib, pkgs, ...}: let 
  inherit (lib) mkDefault mkMerge;
in {
  imports = [
    ./programs
    ./options/features.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home = {
    username = "michael";
    homeDirectory = "/home/michael";
    file = import ./files/fileList.nix {inherit config lib;};
    packages = (import ./packages/common.nix {inherit pkgs;});
    stateVersion = mkDefault "24.05";
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "librewolf";
    NIXOS_OZONE_WL = "1";
    GTK_USE_PORTAL = "1";
  };
}
