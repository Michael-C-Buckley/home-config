{ pkgs, ... }:
let
  geometryPrompt = pkgs.fetchFromGitHub {
    owner = "geometry-zsh";
    repo = "geometry";
    rev = "7e245c627d0b4c58dffc59899c9ef9f5027adba0";
    sha256 = "sha256-kUxtqKQb0OugDkflPQ49OoH51kwgjBHBeNrS1fE8inE=";
  };
in
{
  home.file.".oh-my-zsh/custom/plugins/geometry" = {
    source = geometryPrompt;
  };

  # Enable Geometry in your shell configuration
  programs.zsh = {
    enable = true;
    plugins = [ "geometry" ]; # Add it to Zsh plugins
  };
}
