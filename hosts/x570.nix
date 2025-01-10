{ ... }:
{
  imports = [
    ../modules/hyprland/hosts/x570.nix
    ./extras.nix
  ];
  home.stateVersion = "24.05";
}
