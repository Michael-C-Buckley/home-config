{config, lib, ...}: lib.mkMerge [
  (import ./nix/standard.nix)
  (lib.mkIf config.features.hyprland.enable (import ./nix/hyprland.nix))
]