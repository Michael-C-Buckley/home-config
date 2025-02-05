# X570 Hyprland via Home-Manager
{...}: let
  # Main Innoncn Ultrawide
  mon1 = "DP-1";
  # Right 24
  mon2 = "HDMI-A-2";
in {
  wayland.windowManager.hyprland.settings = {
    monitor = [
      "${mon1},3440x1440@144.00,0x0,1"
      "${mon2},2560x1440@59.95,3440x-500,1,transform,3"
    ];

    workspace = [
      "1, monitor:${mon1}, default:true"
      "2, monitor:${mon1}"
      "9, monitor:${mon2}, default:true"
      "10, monitor:${mon2}, default:true"
    ];

    exec-once = [
      "hyprpaper &"
      "nm-applet --indicator &"
      "blueman-applet &"
      "waybar &"
      "dunst &"
      "gammastep -l 36:-78 -t 6500k:1800k"
      "[workspace 5 silent] $terminal"
      "[workspace 6 silent] signal-desktop"
      "[workspace 6 silent] kotatogram-desktop"
    ];
  };
}
