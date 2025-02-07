# Hyprland Look and Feel Section
{...}: {
  config.wayland.windowManager.hyprland.settings.general = {
    # https://wiki.hyprland.org/Configuring/Variables/#general
    gaps_in = 5;
    gaps_out = 20;
    border_size = 2;
    layout = "dwindle";

    # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
    "col.active_border" = "rgba(325e70ab)";
    "col.inactive_border" = "rgba(595959aa)";

    # Set to true enable resizing windows by clicking and dragging on borders and gaps
    resize_on_border = true;

    # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
    allow_tearing = false;
  };

  config.wayland.windowManager.hyprland.settings.decoration = {
    # https://wiki.hyprland.org/Configuring/Variables/#decoration
    rounding = 10;

    # Change transparency of focused and unfocused windows
    active_opacity = 1.0;
    inactive_opacity = 1.0;

    # drop_shadow = true;
    # shadow_range = 4;
    # shadow_render_power = 3;
    # "col.shadow" = "rgba(1a1a1aee)";

    blur = {
      # https://wiki.hyprland.org/Configuring/Variables/#blur
      enabled = false;
      size = 3;
      passes = 1;
      vibrancy = 0.1696;
    };
  };

  config.wayland.windowManager.hyprland.settings.animations = {
    # https://wiki.hyprland.org/Configuring/Variables/#animations
    enabled = true;

    # Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

    bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

    animation = [
      "windows, 1, 7, myBezier"
      "windowsOut, 1, 7, default, popin 80%"
      "border, 1, 10, default"
      "borderangle, 1, 8, default"
      "fade, 1, 7, default"
      "workspaces, 1, 6, default"
    ];
  };

  config.wayland.windowManager.hyprland.settings.dwindle = {
    # https://wiki.hyprland.org/Configuring/Dwindle-Layout/
    pseudotile = true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
    preserve_split = true; # You probably want this
  };

  config.wayland.windowManager.hyprland.settings.master = {
    # https://wiki.hyprland.org/Configuring/Master-Layout/
    new_status = "master";
  };

  config.wayland.windowManager.hyprland.settings.misc = {
    force_default_wallpaper = 0; # Set to 0 or 1 to disable the anime mascot wallpapers
    disable_hyprland_logo = true; # If true disables the random hyprland logo / anime girl background. :(
  };
}
