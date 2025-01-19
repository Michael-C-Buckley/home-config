{ lib,... }:
{
  home.file = {
    ".zshrc".source = lib.file.mkOutOfStoreSymlink ./default.zshrc;
    ".config/zsh/geometry/myGeometry.zsh".source = lib.file.mkOutOfStoreSymlink ./myGeometry.zsh;
  };
}
