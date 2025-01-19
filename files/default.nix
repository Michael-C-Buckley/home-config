{...}: {
  imports = [
    ./zsh
  ];

  home.file = {
    ".gitconfig".source = ./userfiles/.gitconfig;
  };
}
