{...}:
{
  imports =
    [
      ./nushell.nix
      ./vscode.nix
      ./waybar/default.nix
    ];

  # Starship
  programs.starship.enable = true;
  home.file.".config/starship.toml".source = ../files/userfiles/starship.toml;
}
