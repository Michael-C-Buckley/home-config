{lib, inputs, ...}: {
  imports = [
    inputs.hjem.nixosModules.default
    ./packages
    ./programs
    ./files
  ];

  nixpkgs.config.allowUnfree = true;

  home = {
    username = "michael";
    homeDirectory = "/home/michael";
    stateVersion = lib.mkDefault "24.05";
  };

  hjem = {
    clobberByDefault = true;
    users.michael = {
      enable = true;
      user = "michael";
      directory = "/home/michael";
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "librewolf";
    NIXOS_OZONE_WL = "1";
    GTK_USE_PORTAL = "1";
  };
}
