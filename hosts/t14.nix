{...}: {
  imports = [
    ../files/desktop.nix
    ../modules/hyprland
    ../modules/hyprland/hosts/t14.nix
    ../modules/graphics.nix
    ./extras.nix
  ];
  home.stateVersion = "24.05";
}
