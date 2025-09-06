{flake, ...}: {
  flake.userFiles.default = import ../flake/findFiles.nix;
}
