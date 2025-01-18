{pkgs, unstablePkgs, ...}:
let
  unstablePkgList = with unstablePkgs; [
    lla # Not in 24.11 yet
  ];
in {
  home.packages = with pkgs; [
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
  ] ++ unstablePkgList;
}
