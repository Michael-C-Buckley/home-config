{platform, ...}: let
  graphicImports = [
    ./vscode.nix
    ./waybar/default.nix
  ];
in {
  imports =
    [./nushell.nix]
    ++ (
      if (platform != "server")
      then graphicImports
      else []
    );
}
