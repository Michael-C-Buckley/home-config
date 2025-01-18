{...}: {
  imports = [
    ../modules/hyperland
    ../modules/hyprland/hosts/x570.nix
    ../modules/graphics.nix
    ../files/desktop.nix
    ./extras.nix
  ];
  home.stateVersion = "24.05";
}
