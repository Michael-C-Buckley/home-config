# Waybar Options for Laptops

# This is a set merged later under `programs.waybar.settings`

{
  # Laptops overwrite the standard edition with new options
  # Additions: backlight, battery
  modules-right = [
    "backlight"
    "pulseaudio"
    "clock"
    "battery"
    "custom/power"
  ];

  backlight = {
    tooltip = false;
    format = " {}%";
    interval  =1;
    on-scroll-up = "brightnessctl s 10%+";
    on-scroll-down = "brightnessctl s 10%-";
    on-click = "brightnessctl s 100%";
    on-click-right = "brightnessctl s 1";
  };

  battery = {
    states = {
      good = 95;
      warning = 30;
      critical = 20;
    };
    format = "{icon}  {capacity}%";
    format-charging = " {capacity}%";
    format-plugged = " {capacity}%";
    format-alt = "{time} {icon}";
    format-icons = ["" "" "" "" ""];
  }; 
}