{pkgs, ...}: {
  home.packages = with pkgs; [
    # System Utilities
    networkmanagerapplet
    cpu-x
    pavucontrol # Pulse Volume control
    gammastep
    wireshark

    # Terminals
    ghostty
    kitty

    # Desktop
    xfce.thunar # File manager

    # Communication
    librewolf
    brave
    signal-desktop
    discord
    kotatogram-desktop # Telegram Fork
    tor-browser

    # Media
    vlc
    zathura # PDF Viewer
    sxiv # Simple photo viewer

    # Productivity
    kdePackages.kalgebra # Calculator
    neovide # Nvim GUI
    obsidian
    libreoffice
    gimp
    zed-editor
  ];
}
