# Waybar Home Configuration
{config, lib, ...}:
let
  enabled = config.features.waybar.enable;
  baseDir = ".config/waybar";
in {
  programs.waybar = {
    enable = enabled;
  };

  home.file = lib.mkIf enabled {
    # I am currently using the Waybar Minimal project as my base
    "${baseDir}/config".source = ./waybar-minimal/config;
    "${baseDir}/style.css".source = ./waybar-minimal/style.css;
    "${baseDir}/scripts/powerdraw.sh".source = ./waybar-minimal/scripts/powerdraw.sh;
  };
}
