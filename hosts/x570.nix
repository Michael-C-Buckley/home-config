{ inputs, ... }:
{
  imports = [
    ../modules/hyprland/hosts/x570.nix
    ../modules/development.nix
    ../packages/graphical.nix
    ../packages/productivity.nix
    ../programs/zsh
    ../programs/zsh/geometry.nix
  ];
}
