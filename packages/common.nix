{pkgs, ...}: 
with pkgs; [
  # Git/Web
  git
  tig
  curl
  wget

  # Shells/Terminals
  zsh
  fish
  nushell
  direnv
  blesh # Bash Line Editor - for Starship transient prompt
  starship
  pure-prompt # For Zsh
  fishPlugins.pure # Fish's Pure Port

  # Machine Utilites
  python
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
]