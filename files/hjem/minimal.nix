{ hjem, ... }:
{
  imports = [
    hjem.nixosModules.default
    ./zsh
  ];

  hjem = {
    clobberByDefault = true;
    users.michael = {
      enable = true;
      user = "michael";
      directory = "/home/michael";
    };
  };

  hjem.users.michael.files = {
    ".gitconfig".source = ./userfiles/.gitconfig;
  };
}
