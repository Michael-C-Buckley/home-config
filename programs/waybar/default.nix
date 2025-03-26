# Waybar Home Configuration
{config, lib, ...}:
let
  enabled = config.features.michael.waybar.enable;
  baseDir = ".config/waybar";
in {
  programs.waybar = {
    enable = enabled;
  };

  home.file = lib.mkIf enabled {
    # I am currently using the Purple Moon Minimal as my base
    "${baseDir}/config".source = ./moon-purple/config;
    "${baseDir}/style.css".source = ./moon-purple/style.css;
    # "${baseDir}/scripts/powerdraw.sh".source = ./waybar-minimal/scripts/powerdraw.sh;
  };
}
