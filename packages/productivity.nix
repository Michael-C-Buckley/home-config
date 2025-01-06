{ unstablePkgs, ... }: {
  home.packages = with unstablePkgs; [
    obsidian
    libreoffice
  ];
}
