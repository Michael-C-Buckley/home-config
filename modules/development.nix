{pkgs, ...}: {
  imports = [../programs/vscode.nix];

  home.packages = with pkgs; [
    devenv
    python3
    zed-editor
    helix
    meld
    nixd
    nil
    nixfmt-rfc-style
    alejandra
  ];
}
