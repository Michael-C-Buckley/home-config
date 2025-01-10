{ ... }:
{
  imports = [
    ../modules/hyprland/hosts/t14.nix
    ./extras.nix
  ];
  home.stateVersion = "24.05";
}
