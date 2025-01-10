{ ... }:
{
  imports = [
    ../modules/hyprland/hosts/t14.nix
    ./extras.nix
  ];
  home-manager.users.michael.home.stateVersion = "24.05";
}
