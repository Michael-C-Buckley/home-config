# Waybar Common Settings

# This is a set merged later under `programs.waybar.settings`

{
  layer = "top";
  margin-bottom = -5;
  margin-top = 10;
  modules-left = [
    "tray"
    "hyprland/workspaces"
  ];
  modules-center = [
    "clock"
  ];

  modules-right = [
    "pulseaudio"
    "custom/power"
  ];

  pulseaudio = {
    tooltip = false;
    scroll-step = 5;
    format = "{icon} {volume}%";
    format-muted = "{icon} *M{volume}%*";
    on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
    on-click-right = "pavucontrol";
    format-icons = {
      default = [
        ""
        ""
        ""
      ];
    };
  };

  network = {
    format-wifi = "";
    format-ethernet = "";
    tooltip-format = "{essid} ({signalStrength}%)";
    format-linked = "{ifname} (No IP) ";
    format-disconnected = "⚠";
    format-alt = "{ifname}: {ipaddr}/{cidr}";
  };

  tray = {
    icon-size = 18;
    spacing = 10;
  };

  clock = {
    #format = "{: %I:%M %p   %d/%m/%Y}";
    tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
    format-alt = "{:%Y-%m-%d}";
  };

  "custom/power" = {
    format = " ⏻ ";
    on-click = "nwgbar";
    tooltip = false;
  };

  "hyrpland/workspaces" = {
    format = "{icon}";
    on-scroll-up = "hyprctl dispatch workspace e+1";
    on-scroll-down = "hyprctl dispatch workspace e-1";
    on-click = "activate";
  };
}
