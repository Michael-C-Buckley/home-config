{...}: {
  imports =
    [
      ./nushell.nix
      ./waybar/default.nix
    ];

  # Starship
  programs.starship.enable = true;
}
