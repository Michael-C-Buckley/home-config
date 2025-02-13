{config, lib, ...}: {
  imports = [
    ./options/features.nix
    ./packages
    ./programs
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
