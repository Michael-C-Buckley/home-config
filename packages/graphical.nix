{pkgs, ...}: {
  home.packages = with pkgs; [
    # System Utilities
    networkmanagerapplet
    cpu-x
    pavucontrol # Pulse Volume control
    gammastep
    wireshark

    # Desktop
    xfce.thunar

    # Communication
    librewolf
    brave
    signal-desktop
    vesktop # Independent Discord
    kotatogram-desktop # Telegram Fork
    tor-browser

    # Media
    vlc
    zathura # PDF Viewer
    sxiv # Simple photo viewer

    # Productivity
    kdePackages.kalgebra # Calculator
    neovide # Nvim GUI
    ghostty
  ];
}
