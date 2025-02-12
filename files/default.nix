{...}: {
  home.file = {
    ".gitconfig".source = ./userfiles/.gitconfig;

    # Shell Common
    ".config/starship.toml".source = ./shells/starship.toml;
    ".config/shells/aliases.sh".source = ./shells/aliases.sh;
    ".config/shells/environment.sh".source = ./shells/environment.sh;

    # Bash
    ".bashrc" = ./bash/.bashrc;

    # Zsh
    ".zshrc".source = ./zsh/default.zshrc;
    ".config/zsh/geometry/myGeometry.zsh".source = ./zsh/myGeometry.zsh;
  };
}
