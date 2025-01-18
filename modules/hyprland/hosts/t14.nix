# T14 Hyprland via Home-Manager
{...}: {
  config.wayland.windowManager.hyprland.settings = {
    monitor = "eDP-1,1920x1080@60.01Hz,0x0,1";

    exec-once = [
      "hyprpaper &"
      "nm-applet --indicator &"
      "blueman-applet &"
      "waybar &"
      "dunst &"
      "gammastep -l 36:-78 -t 6500k:1000k"
      "[workspace special:magic1 silent] $terminal"
      "[workspace special:magic2 silent] signal-desktop"
      "[workspace special:magic2 silent] kotatogram-desktop"
    ];
  };
}
