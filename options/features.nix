{ lib, ... }: let 
  inherit (lib) types mkOption mkEnableOption;
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
      graphics = mkEnableOption {};
      hyprland.enable = mkEnableOption {};
      vscode.enable = mkEnableOption {};
      waybar.enable = mkEnableOption {};
    };
  };
}
