{unstablePkgs, ...}: {
  imports = [
    ./custom/geometry.nix
  ];

  home.packages = with unstablePkgs; [
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
