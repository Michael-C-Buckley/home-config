{ unstablePkgs, ... }: {
  home.packages = with unstablePkgs; [
    devenv
    python3
    zed-editor
    helix
    meld
    nixd
    nil
    nixfmt-rfc-style
  ];
}
