{...}: {
  imports = [
    ../modules/hyprland/hosts/t14.nix
    ../modules/graphics.nix
    ./extras.nix
  ];
  home.stateVersion = "24.05";

  features = {
    vscode.enable = true;
    waybar.enable = true;
    hyprland.enable = true;
  };
}
