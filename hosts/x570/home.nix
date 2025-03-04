{config, ...}: {
  imports = [
    ../../modules/graphics.nix
    ../extras.nix
  ];
  home = {
    stateVersion = "24.05";
    # Link Hyprland host specific file
    file.".config/hypr/host.conf".source = ./hyprland.conf;
  };

  features = {
    vscode.enable = true;
    waybar.enable = true;
    hyprland.enable = true;
  };
}
