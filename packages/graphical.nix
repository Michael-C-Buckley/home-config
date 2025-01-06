{ pkgs, unstablePkgs, ... }:

let
  regularPkgList = with pkgs; [
    # System Utilities
    networkmanagerapplet
    cpu-x
    pavucontrol     # Pulse Volume control
    gammastep

    # Communication
    librewolf
    brave
    signal-desktop
    vesktop               # Independent Discord
    kotatogram-desktop    # Telegram Fork
    tor-browser

    # Media
    vlc
    gimp
    zathura               # PDF Viewer
    sxiv                  # Simple photo viewer

    # Productivity
    kdePackages.kalgebra  # Calculator
    neovide               # Nvim GUI
  ];

  unstablePkgList = with unstablePkgs; [
    wireshark
    ghostty
  ];
in
{
  home.packages = regularPkgList ++ unstablePkgList;
}
