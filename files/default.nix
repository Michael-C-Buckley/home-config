{...}: {
  imports = [
    ./bash
    ./zsh
  ];

  home.file = {
    ".gitconfig".source = ./userfiles/.gitconfig;
  };
}
