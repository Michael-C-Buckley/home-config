{unstablePkgs, inputs, system, ...}: {
  # imports = [
  #   ./custom/geometry.nix
  # ];

  home.packages = with unstablePkgs; [
    inputs.geometry.packages.${system}
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
