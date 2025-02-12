{...}: {
  imports = [
    ./bash
    ./shells
    ./zsh
  ];

  home.file = {
    ".gitconfig".source = ./userfiles/.gitconfig;
    ".config/ghostty/config".source = ./userfiles/ghostty;
    ".config/starship.toml".source = ./userfiles/starship.toml;
  };
}
