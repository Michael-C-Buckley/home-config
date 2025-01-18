{unstablePkgs, geometry, system, ...}: {
  home.packages = with unstablePkgs; [
    geometry.packages.${system}
    git
    tig
    curl
    wget
    lla
    bat
    killall
    du-dust
    atop
    btop
    fd
    fzf
    zoxide
  ];
}
