{ lib, ... }: let 
  inherit (lib) types mkOption;
  inherit (types) bool;
in {
  options = {
    # Define custom options here
    features = {
      useHome = mkOption {
        type = bool;
        default = true;
        description = "Use home-manager for any features covered by hjem";
      };
      hyprland.enable = mkOption {
        type = bool;
        default = false;
        description = "Include my Hyprland configurations.";
      };
      vscode.enable = mkOption {
        type = bool;
        default = false;
        description = "Include my VSCode configurations.";
      };
      waybar.enable = mkOption {
        type = bool;
        default = false;
        description = "Enable my Waybar configurations.";
      };
    };
  };
}
