{...}: {
  imports = [
    ../../modules/graphics.nix
    ../../packages/graphical.nix
  ];
  home = {
    stateVersion = "24.05";
  };

  features = {
    useHome = true;
  };
}
