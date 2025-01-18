# Hyprland Input
{...}: {
  config.wayland.windowManager.hyprland.settings.input = {
    # https://wiki.hyprland.org/Configuring/Variables/#input
    kb_layout = "us";
    follow_mouse = 1;
    sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
    touchpad = {
      natural_scroll = false;
    };
  };

  config.wayland.windowManager.hyprland.settings.gestures = {
    # https://wiki.hyprland.org/Configuring/Variables/#gestures
    workspace_swipe = false;
  };

  config.wayland.windowManager.hyprland.settings.device = {
    # https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs
    # Example per-device config
    name = "epic-mouse-v1";
    sensitivity = -0.5;
  };
}
