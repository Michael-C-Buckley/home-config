# Adds configs for GUI and other non-Server functionality
{ lib, ...}: {
  home.file = {
    "ghostty/config".source = lib.file.mkOutOfStoreSymlink ./userfiles/ghostty;
  };
}
