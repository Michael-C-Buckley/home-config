{unstablePkgs, inputs, system, ...}:
let
  unstablePkgList = with unstablePkgs; [
    lla # Not in 24.11 yet
  ];
in {
  home.packages = with unstablePkgs; [
    git
    tig
    curl
    wget
    bat
    killall
    du-dust
    atop
    btop
    fd
    fzf
    zoxide

    # Each source flake will need geometry in the inputs
    inputs.geometry.packages.${system}
  ] ++ unstablePkgList;
}
