# Preload the Repl with various aliases and functions, see for more info:
# https://bmcgee.ie/posts/2023/01/nix-and-its-slow-feedback-loop/#how-you-should-use-the-repl
# Special thanks to Iynaix for the inspiration:
# https://github.com/iynaix/dotfiles/blob/main/repl.nix
let
  inherit (builtins) getFlake;
  flake = getFlake (toString ./.);
in
  rec {
    inherit (flake) inputs;
    inherit (flake.inputs) nixpkgs;
    inherit flake;

    pkgs = import nixpkgs {system = "x86_64-linux";};
  }
  // flake
