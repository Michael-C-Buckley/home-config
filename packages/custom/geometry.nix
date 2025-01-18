# Geometry Zsh Prompt
{pkgs, ...}: {
  home.packages = [
    (pkgs.fetchFromGitHub {
      owner = "geometry-zsh";
      repo = "geometry";
      rev = "7e245c627d0b4c58dffc59899c9ef9f5027adba0";
      sha256 = "sha256-kUxtqKQb0OugDkflPQ49OoH51kwgjBHBeNrS1fE8inE=";
    })
  ];
}
