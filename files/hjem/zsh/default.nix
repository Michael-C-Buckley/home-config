{pkgs, ...}: let
  geometry-zsh = pkgs.fetchFromGitHub {
    owner = "geometry-zsh";
    repo = "geometry";
    rev = "7e245c627d0b4c58dffc59899c9ef9f5027adba0";
    sha256 = "sha256-kUxtqKQb0OugDkflPQ49OoH51kwgjBHBeNrS1fE8inE=";
  };
in {
  hjem.users.michael = {
    files = {
      ".config/resources/geometry".source = "${geometry-zsh}";
      ".zshrc".source = ./default.zshrc;
    };
  };
}
