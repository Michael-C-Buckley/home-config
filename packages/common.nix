{pkgs, ...}: 
with pkgs; [
  # Git/Web
  git
  tig
  curl
  wget

  # Shells
  zsh
  fish
  nushell

  # Machine Utilites
  ripgrep
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