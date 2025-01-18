# Hyprland Binds
{lib, ...}: let
  workspaces = [
    "$mod, 1, workspace, 1"
    "$mod, 2, workspace, 2"
    "$mod, 3, workspace, 3"
    "$mod, 4, workspace, 4"
    "$mod, 5, workspace, 5"
    "$mod, 6, workspace, 6"
    "$mod, 7, workspace, 7"
    "$mod, 8, workspace, 8"
    "$mod, 9, workspace, 9"
    "$mod, 0, workspace, 10"
    "$mod SHIFT, 1, movetoworkspace, 1"
    "$mod SHIFT, 2, movetoworkspace, 2"
    "$mod SHIFT, 3, movetoworkspace, 3"
    "$mod SHIFT, 4, movetoworkspace, 4"
    "$mod SHIFT, 5, movetoworkspace, 5"
    "$mod SHIFT, 6, movetoworkspace, 6"
    "$mod SHIFT, 7, movetoworkspace, 7"
    "$mod SHIFT, 8, movetoworkspace, 8"
    "$mod SHIFT, 9, movetoworkspace, 9"
    "$mod SHIFT, 0, movetoworkspace, 10"
    "$mod, A, togglespecialworkspace, magic1"
    "$mod SHIFT, A, movetoworkspace, special:magic1"
    "$mod, S, togglespecialworkspace, magic2"
    "$mod SHIFT, S, movetoworkspace, special:magic2"
    "$mod, D, togglespecialworkspace, magic3"
    "$mod SHIFT, D, movetoworkspace, special:magic3"
    "$mod, F, togglespecialworkspace, magic4"
    "$mod SHIFT, F, movetoworkspace, special:magic4"
    "$mod, J, togglespecialworkspace, magic5"
    "$mod SHIFT, J, movetoworkspace, special:magic5"
    "$mod, K, togglespecialworkspace, magic6"
    "$mod SHIFT, K, movetoworkspace, special:magic6"
  ];

  moveFocus = [
    "$mod, left, movefocus, l"
    "$mod, right, movefocus, r"
    "$mod, up, movefocus, u"
    "$mod, down, movefocus, d"
    "$mod, mouse_down, workspace, e+1"
    "$mod, mouse_up, workspace, e-1"
  ];

  resizeWindows = [
    "$mod ALT, left, resizeactive, -200 0"
    "$mod ALT, right, resizeactive, 200 0"
    "$mod ALT, up, resizeactive, 0 -200"
    "$mod ALT, down, resizeactive, 0 200"
  ];

  mediaBinds = [
    # Brightness
    ", XF86MonBrightnessDown, exec, brightnessctl s 10%-"
    ", XF86MonBrightnessUp, exec, brightnessctl s +10%"

    # Screenshots
    "$mod, Home, exec, hyprshot -m region"

    # Waybar Control
    "$mod, B, exec, pkill -f waybar && waybar &"
  ];
in {
  config.wayland.windowManager.hyprland.settings.bind =
    [
      "$mod, W, exec, rofi -show drun -show-icons"
      "$mod, Return, exec, $terminal"
      "$mod, Q, killactive,"
      "$mod, M, exit,"
      "$mod, E, exec, $fileManager"
      "$mod, V, togglefloating,"
      "$mod, R, exec, $menu"
      "$mod, P, pseudo," # dwindle
      "$mod, G, togglesplit," # dwindle
      "$mod, I, exec, $ide"
      "$mod, Z, exec, zeditor"
      "$mod, O, exec, $browser"
      "$mod, L, exec, swaylock"
      "$mod CTRL, semicolon, exec, sudo shutdown now"
      "$mod CTRL ALT, semicolon, exec, sudo reboot now"
    ]
    ++ workspaces
    ++ moveFocus
    ++ resizeWindows
    ++ mediaBinds;

  config.wayland.windowManager.hyprland.settings.bindm = lib.mkDefault [
    # Move/resize windows with mainMod + LMB/RMB and dragging
    "$mod, mouse:272, movewindow"
    "$mod, mouse:273, resizewindow"
  ];

  config.wayland.windowManager.hyprland.settings.binde = lib.mkDefault [
    ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%-"
    ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 10%+" # To raise the volume, with a limit of 150%
    ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
  ];
}
