# Base Entry for Home-Manager
{config, lib, ...}: {
  imports = [
    ./programs
    ./options/features.nix
    ./packages/home.nix
    ./files/home.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home = {
    username = "michael";
    homeDirectory = "/home/michael";
    stateVersion = lib.mkDefault "24.05";
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "librewolf";
    NIXOS_OZONE_WL = "1";
    GTK_USE_PORTAL = "1";
  };
}
