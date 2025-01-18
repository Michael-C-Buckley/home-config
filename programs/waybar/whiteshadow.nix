# Whiteshadow's Waybar
# Adapted from: https://github.com/elifouts/Dotfiles/tree/6df11f34f21bd04e9f0a7ec4f54bb87222f77a9d/waybar
{
  layer = "top";
  margin-bottom = -5;
  margin-top = 0;
  position = "top";
  modules-left = [
    "custom/notification"
    "clock"
    "tray"
  ];
  modules-center = ["hyprland/workspaces"];
  modules-right = [
    "group/expand"
    "bluetooth"
    "network"
    "battery"
  ];

  "hyprland/workspaces" = {
    format = "{icon}";
    # format-icons = {
    #   active = "";
    #   default = "";
    #   empty = "";
    # };
    on-scroll-up = "hyprctl dispatch workspace e+1";
    on-scroll-down = "hyprctl dispatch workspace e-1";
    on-click = "activate";
    # "persistent-workspaces" = {
    #   "*" = [
    #     1
    #     2
    #     3
    #     4
    #     5
    #   ];
    # };
  };
  "custom/notification" = {
    tooltip = false;
    format = "";
    on-click = "swaync-client -t -sw";
    escape = true;
  };
  clock = {
    format = "{:%H:%M} ";
    interval = 60;
    tooltip-format = "<tt>{calendar}</tt>";
    calendar = {
      format = {
        months = "<span color='#000000'><b>{}</b></span>";
        weekdays = "<span color='#000000'><b>{}</b></span>";
        today = "<span color='#000000'><b>{}</b></span>";
      };
    };
    actions = {
      on-click-right = "shift_down";
      on-click = "shift_up";
    };
  };
  network = {
    format-wifi = "";
    format-ethernet = "";
    format-disconnected = "";
    tooltip-format-disconnected = "Error";
    tooltip-format-wifi = "{essid} ({signalStrength}%) ";
    tooltip-format-ethernet = "{ifname} 🖧 ";
    on-click = "ghostty nmtui";
  };
  bluetooth = {
    format-on = "󰂯";
    format-off = "BT-off";
    format-disabled = "󰂲";
    format-connected-battery = "{device_battery_percentage}% 󰂯";
    format-alt = "{device_alias}󰂯";
    tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
    tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
    tooltip-format-enumerate-connected = "{device_alias}\n{device_address}";
    tooltip-format-enumerate-connected-battery = "{device_alias}\n{device_address}\n{device_battery_percentage}%";
    on-click-right = "blueman-manager";
  };
  battery = {
    interval = 1;
    states = {
      good = 95;
      warning = 30;
      critical = 20;
    };
    format = "{capacity}% {icon}";
    format-charging = "{capacity}% 󰂄";
    format-plugged = "{capacity}% 󰂄 ";
    format-alt = "{time} {icon}";
    format-icons = [
      "󰁻"
      "󰁼"
      "󰁾"
      "󰂀"
      "󰂂"
      "󰁹"
    ];
  };
  "custom/expand" = {
    format = "";
    tooltip = false;
  };
  "custom/endpoint" = {
    format = " | ";
    tooltip = false;
  };
  "group/expand" = {
    orientation = "horizontal";
    drawer = {
      transition-duration = 600;
      transition-to-left = true;
      click-to-reveal = true;
    };
    modules = [
      "custom/expand"
      "custom/colorpicker"
      "cpu"
      "memory"
      "temperature"
      "custom/endpoint"
    ];
  };
  "custom/colorpicker" = {
    format = "{}";
    return-type = "json";
    interval = "once";
    exec = "~/.config/waybar/scripts/colorpicker.sh -j";
    on-click = "~/.config/waybar/scripts/colorpicker.sh";
    signal = 1;
  };
  cpu = {
    format = "󰻠";
    tooltip = true;
  };
  memory = {
    format = "";
  };
  temperature = {
    critical-threshold = 80;
    format = "{icon}";
    format-icons = [
      ""
      ""
      ""
    ];
  };
  tray = {
    icon-size = 14;
    spacing = 10;
  };
}
