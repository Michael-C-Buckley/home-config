{ lib, ... }: let 
  inherit (lib) types mkOption;
  inherit (types) bool;
in {
  options = {
    # Define custom options here
    features = {
      skipDuplicates = mkOption {
        type = bool;
        default = false;
        description = "Skip any Hjem-covered features when evaulating home-manager config";
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
