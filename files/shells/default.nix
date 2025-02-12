{...}: {
  home.file = {
    ".config/shells/aliases.sh".source = ./aliases.sh;
    ".config/shells/environment.sh".source = ./environment.sh;
  };
}