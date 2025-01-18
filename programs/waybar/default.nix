# Waybar Home Configuration
{platform, ...}:
{
  programs.waybar = {
    enable = platform != "server";
  };

  home.file = {
    ".config/waybar/config" = {
      source = ./configs/config;
    };
    ".config/waybar/style.css" = {
      source = ./configs/style.css;
    };
  };
}
