# Hpyrland Config

{ pkgs, ... }:

{
  imports = [
    ./binds.nix
    ./lookfeel.nix
    ./input.nix
  ];

  home.packages = with pkgs; [
    swaylock
    wofi
  ];

  wayland.windowManager.hyprland.settings = {
    # Host-specific: monitor, exec-once

    # Hyprland's My Programs
    "$mod" = "SUPER";
    "$terminal" = "ghostty";
    "$menu" = "wofi -s drun -show-icons";
    "$ide" = "code";
    "$browser" = "librewolf";
    "$fileManager" = "thunar";

    env = [
      # https://wiki.hyprland.org/Configuring/Environment-variables/
      "XCURSOR_SIZE,24"
      "HYPRCURSOR_SIZE,24"
    ];

    windowrulev2 = [
      # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
      # See https://wiki.hyprland.org/Configuring/Workspace-Rules/ for workspace rules
      "suppressevent maximize, class:.*" # You'll probably like this.
    ];
  };
}
