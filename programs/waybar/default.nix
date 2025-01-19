# Waybar Home Configuration
{config, lib, ...}:
let
  enabled = config.features.waybar.enable;
in {
  programs.waybar = {
    enable = enabled;
  };

  home.file = lib.mkIf enabled {
    ".config/waybar/config" = {
      source = ./configs/config;
    };
    ".config/waybar/style.css" = {
      source = ./configs/style.css;
    };
  };
}
