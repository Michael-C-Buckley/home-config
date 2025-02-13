{...}: {
  imports =
    [
      ./nushell.nix
      ./vscode.nix
      ./waybar/default.nix
    ];

  # Starship
  programs.starship.enable = true;
}
