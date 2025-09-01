{pkgs, ...}:
with pkgs; [
  # System Utilities
  networkmanagerapplet
  pavucontrol # Pulse Volume control
  gammastep
  gparted
  wireshark

  # Browser
  vivaldi

  # Editors
  emacs
  meld
  vscodium-fhs

  # File Explorer
  mate.caja

  # Media
  mpv
  imv
  zathura # PDF Viewer
  kdePackages.koko # Photo Viewer
  foliate # Ebook Reader

  # Productivity
  kdePackages.kalgebra # Calculator
  gimp3
  obsidian

  # Terminals
  kitty
  kitty-themes

  # Communication
  bitwarden
  signal-desktop
  materialgram
  legcord
]
