{pkgs, ...}: {
  imports = [../programs/vscode.nix];

  home.packages = with pkgs; [
    devenv
    python3
    # zed-editor # Cache miss on NixOS currently
    helix
    meld
    nixd
    nil
    nixfmt-rfc-style
    alejandra
  ];
}
