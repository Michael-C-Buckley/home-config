{...}: {
  imports = [
    ./zsh
  ];

  hjem.users.michael.files = {
    ".gitconfig".source = ./userfiles/.gitconfig;
  };
}
