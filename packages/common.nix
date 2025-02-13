{pkgs, ...}: 
with pkgs; [
  starship
  git
  tig
  curl
  wget
  lla
  bat
  killall
  du-dust
  atop
  btop
  fd
  fzf
  zoxide

  # Bash Line Editor - for Starship transient prompt
  blesh
]