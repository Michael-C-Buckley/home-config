{ lib,... }:
{
  home.file = {
    ".zshrc".source = lib.mkOutOfStoreSymlink ./default.zshrc;
    ".config/zsh/geometry/myGeometry.zsh".source = lib.mkOutOfStoreSymlink ./myGeometry.zsh;
  };
}
