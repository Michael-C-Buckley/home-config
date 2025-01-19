{...}: {
  imports = [
    ../files/desktop.nix
    ../modules/hyprland
    ../modules/hyprland/hosts/x570.nix
    ../modules/graphics.nix
    ./extras.nix
  ];
  home.stateVersion = "24.05";

  features = {
    vscode.enable = true;
    waybar.enable = true;
  };
}
