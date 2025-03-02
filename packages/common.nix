{pkgs, ...}: 
with pkgs; [
  # Git/Web
  git
  tig
  curl
  wget

  # Machine Utilites
  rg
  eza
  duf
  bat
  killall
  du-dust
  atop
  btop
  fd
  fzf
  zoxide

  # Terminal/Prompt
  blesh # Bash Line Editor - for Starship transient prompt
  starship
  direnv
]