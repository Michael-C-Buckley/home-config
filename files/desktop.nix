# Adds configs for GUI and other non-Server functionality
{ ...}: {
  home.file = {
    "ghostty/config".source = ./userfiles/ghostty;
  };
}
