{ lib, ... }:
{
  options = {
    # Define custom options here
    features.hyprland.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Include my Hyprland configurations.";
    };

    features.vscode.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Include my VSCode configurations.";
    };

    features.waybar.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable my Waybar configurations.";
    };
  };
}
