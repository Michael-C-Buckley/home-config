{ ... }:
{
  imports = [
    ../modules/hyprland/hosts/x570.nix
    ./extras.nix
  ];
  home-manager.users.michael.home.stateVersion = "24.05";
}
