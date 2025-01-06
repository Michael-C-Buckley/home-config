# Waybar Home Configuration

{ platform, ... }:

let
  commonSettings = import ./common.nix;
  laptopOptions = import ./laptop.nix;
  newOptions = import ./whiteshadow.nix;
in

{
  programs.waybar = {
    enable = platform != "server";
    # style = ./style.css;
    # style = ./whiteshadow.css;

    # settings = if platform == "laptop" then [ ( commonSettings // laptopOptions ) ] else [ commonSettings ];
    # settings = [ newOptions ];
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
