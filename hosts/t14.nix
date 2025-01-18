{...}: {
  imports = [
    ../modules/hyperland
    ../modules/hyprland/hosts/t14.nix
    ../modules/graphics.nix
    ../files/desktop.nix
    ./extras.nix
  ];
  home.stateVersion = "24.05";
}
